import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'report_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';
import 'package:dio/dio.dart';

class ReportCubit extends Cubit<ReportState> {
  final Dio _dio = Dio();
  Timer? _tripTimer;

  final String _orsApiKey =
      "eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6IjE2ZGZjOTEzMGNlNjQ1ZGNiYWRkMTJiNTUxNThjYmYxIiwiaCI6Im11cm11cjY0In0=";

  ReportCubit() : super(const ReportState());

  void startTrip() {
    if (state.duration == null) return;

   
    int initialMinutes = int.tryParse(state.duration!.split(' ')[0]) ?? 0;
    int totalSeconds = initialMinutes * 60;

    emit(
      state.copyWith(
        isTripStarted: true,
        remainingSeconds: totalSeconds,
        remainingTime: initialMinutes,
      ),
    );

    _tripTimer?.cancel();
    _tripTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (state.remainingSeconds > 0) {
        int newSeconds = state.remainingSeconds - 1;

        emit(
          state.copyWith(
            remainingSeconds: newSeconds,
            remainingTime: (newSeconds / 60).ceil(), 
          ),
        );


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
    emit(
      state.copyWith(showSafetyCheck: false, showAlmostFinishedDialog: false),
    );
 
  }

  void finishTrip() {
    _tripTimer?.cancel();
    emit(
      state.copyWith(
        isTripStarted: false,
        showSafetyCheck: false,
        showAlmostFinishedDialog: false,
        routePoints: [],
        distance: null,
        duration: null,
        remainingSeconds: 0,
      ),
    );
  }

  

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
      emit(
        state.copyWith(
          selectedLocation: location,
          locationName: "${location.latitude}, ${location.longitude}",
        ),
      );
      await getDirections(location);
    }
  }

  void nextStep() {
    if (state.currentStep < 3)
      emit(state.copyWith(currentStep: state.currentStep + 1));
  }

  void previousStep() {
    if (state.currentStep > 1)
      emit(state.copyWith(currentStep: state.currentStep - 1));
  }

  void toggleNow(bool value) => emit(state.copyWith(isNow: value));
  void setDate(DateTime date) => emit(state.copyWith(date: date));
  void setTime(TimeOfDay time) => emit(state.copyWith(time: time));

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
        List<LatLng> routePoints = coords
            .map((c) => LatLng(c[1].toDouble(), c[0].toDouble()))
            .toList();
        double distanceInKm =
            feature['properties']['summary']['distance'] / 1000;
        double durationInMin =
            feature['properties']['summary']['duration'] / 60;
        emit(
          state.copyWith(
            routePoints: routePoints,
            distance: "${distanceInKm.toStringAsFixed(1)} كم",
            duration: "${durationInMin.toInt()} دقيقة",
            isLoadingRoute: false,
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(isLoadingRoute: false));
    }
  }

  @override
  Future<void> close() {
    _tripTimer?.cancel();
    return super.close();
  }
}
