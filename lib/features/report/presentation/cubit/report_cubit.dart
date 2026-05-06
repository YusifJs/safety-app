import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/features/report/presentation/widgets/upload_model.dart';
import 'report_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:dio/dio.dart';

class ReportCubit extends Cubit<ReportState> {
  final Dio _dio = Dio();
  Timer? _tripTimer;

  final String _orsApiKey = "YOUR_API_KEY";

  ReportCubit() : super(const ReportState());

  // ================== TRIP LOGIC ==================

  void startTrip() {
    if (state.duration == null) return;

    int initialMinutes = int.tryParse(state.duration!.split(' ')[0]) ?? 0;
    int totalSeconds = initialMinutes * 60;

    emit(state.copyWith(
      isTripStarted: true,
      remainingSeconds: totalSeconds,
      remainingTime: initialMinutes,
    ));

    _tripTimer?.cancel();
    _tripTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 0) {
        int newSeconds = state.remainingSeconds - 1;

        emit(state.copyWith(
          remainingSeconds: newSeconds,
          remainingTime: (newSeconds / 60).ceil(),
        ));

        if (newSeconds == 30) {
          emit(state.copyWith(showAlmostFinishedDialog: true));
        }
      } else {
        timer.cancel();
        _triggerAutomaticReport();
      }
    });
  }

  void _triggerAutomaticReport() {
    emit(state.copyWith(showSafetyCheck: true));
  }

  void activateManualReport() {
    emit(state.copyWith(
      showSafetyCheck: false,
      showAlmostFinishedDialog: false,
    ));
  }

  void finishTrip() {
    _tripTimer?.cancel();
    emit(state.copyWith(
      isTripStarted: false,
      showSafetyCheck: false,
      showAlmostFinishedDialog: false,
      routePoints: [],
      distance: null,
      duration: null,
      remainingSeconds: 0,
    ));
  }

  // ================== LOCATION ==================

  Future<void> setLocation(LatLng location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      String name = placemarks.isNotEmpty
          ? "${placemarks.first.street}, ${placemarks.first.locality}"
          : "موقع غير مسمى";

      emit(state.copyWith(selectedLocation: location, locationName: name));
      await getDirections(location);
    } catch (e) {
      emit(state.copyWith(
        selectedLocation: location,
        locationName: "${location.latitude}, ${location.longitude}",
      ));
      await getDirections(location);
    }
  }

  Future<void> getDirections(LatLng destination) async {
    LatLng startLocation = const LatLng(30.4606, 31.1856);

    emit(state.copyWith(isLoadingRoute: true));

    try {
      final response = await _dio.get(
        'https://api.openrouteservice.org/v2/directions/driving-car',
        queryParameters: {
          'api_key': _orsApiKey,
          'start': '${startLocation.longitude},${startLocation.latitude}',
          'end': '${destination.longitude},${destination.latitude}',
        },
      );

      if (response.statusCode == 200) {
        final feature = response.data['features'][0];
        final coords = feature['geometry']['coordinates'] as List;

        List<LatLng> routePoints =
            coords.map((c) => LatLng(c[1].toDouble(), c[0].toDouble())).toList();

        double distanceInKm =
            feature['properties']['summary']['distance'] / 1000;

        double durationInMin =
            feature['properties']['summary']['duration'] / 60;

        emit(state.copyWith(
          routePoints: routePoints,
          distance: "${distanceInKm.toStringAsFixed(1)} كم",
          duration: "${durationInMin.toInt()} دقيقة",
          isLoadingRoute: false,
        ));
      }
    } catch (e) {
      emit(state.copyWith(isLoadingRoute: false));
    }
  }

  // ================== STEPS ==================

  void nextStep() {
    if (state.currentStep < 3) {
      emit(state.copyWith(currentStep: state.currentStep + 1));
    }
  }

  void previousStep() {
    if (state.currentStep > 1) {
      emit(state.copyWith(currentStep: state.currentStep - 1));
    }
  }

  void toggleNow(bool value) => emit(state.copyWith(isNow: value));
  void setDate(DateTime date) => emit(state.copyWith(date: date));
  void setTime(TimeOfDay time) => emit(state.copyWith(time: time));

  // ================== REPORT ==================

  Future<void> submitReport() async {
    emit(state.copyWith(isSubmitting: true));

    try {
      await Future.delayed(const Duration(seconds: 2));
      emit(state.copyWith(isSubmitting: false, isSubmitted: true));
    } catch (e) {
      emit(state.copyWith(isSubmitting: false));
    }
  }

  void selectReportType(String type) {
    emit(state.copyWith(selectedReportType: type));
  }

  // ================== UPLOAD ==================

  void addImages(List<String> paths) {
    final items = paths.map((p) => UploadItem(path: p)).toList();
    emit(state.copyWith(images: [...state.images, ...items]));
    for (final item in items) _uploadImage(item);
  }

  void addFiles(List<String> paths) {
    final items = paths.map((p) => UploadItem(path: p)).toList();
    emit(state.copyWith(files: [...state.files, ...items]));
    for (final item in items) _uploadFile(item);
  }

  Future<void> _uploadImage(UploadItem item) async {
    _updateItem(item, status: UploadStatus.uploading);

    for (int i = 1; i <= 10; i++) {
      await Future.delayed(const Duration(milliseconds: 200));
      _updateItem(item, progress: i / 10, status: UploadStatus.uploading);
    }

    _updateItem(item, progress: 1, status: UploadStatus.success);
  }

  Future<void> _uploadFile(UploadItem item) async {
    _updateItem(item, status: UploadStatus.uploading);
    await Future.delayed(const Duration(seconds: 2));
    _updateItem(item, progress: 1, status: UploadStatus.success);
  }

  void _updateItem(UploadItem item,
      {double? progress, UploadStatus? status}) {
    final updatedImages = state.images.map((e) {
      if (e.path == item.path) {
        return e.copyWith(progress: progress, status: status);
      }
      return e;
    }).toList();

    final updatedFiles = state.files.map((e) {
      if (e.path == item.path) {
        return e.copyWith(progress: progress, status: status);
      }
      return e;
    }).toList();

    emit(state.copyWith(images: updatedImages, files: updatedFiles));
  }

  // ================== CLEANUP ==================

  @override
  Future<void> close() {
    _tripTimer?.cancel();
    return super.close();
  }
}