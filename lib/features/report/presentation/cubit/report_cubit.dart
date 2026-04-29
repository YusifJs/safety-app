import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/features/report/presentation/widgets/upload_model.dart';
import 'report_state.dart';
import 'package:latlong2/latlong.dart';
import 'package:geocoding/geocoding.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit() : super(const ReportState());

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

  void toggleNow(bool value) {
    emit(state.copyWith(isNow: value));
  }

  void setDate(DateTime date) {
    emit(state.copyWith(date: date));
  }

  void setTime(TimeOfDay time) {
    emit(state.copyWith(time: time));
  }

  Future<void> setLocation(LatLng location) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        location.latitude,
        location.longitude,
      );

      String name;

      if (placemarks.isNotEmpty) {
        final p = placemarks.first;

        name = [
          p.street,
          p.subLocality,
          p.locality,
          p.country,
        ].where((e) => e != null && e.isNotEmpty).join(", ");
      } else {
        name = "${location.latitude}, ${location.longitude}";
      }

      emit(state.copyWith(selectedLocation: location, locationName: name));
    } catch (e) {
      emit(
        state.copyWith(
          selectedLocation: location,
          locationName: "${location.latitude}, ${location.longitude}",
        ),
      );
    }
  }

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

  void addImages(List<String> paths) {
    final items = paths.map((p) => UploadItem(path: p)).toList();

    emit(state.copyWith(images: [...state.images, ...items]));

    for (final item in items) {
      _uploadImage(item);
    }
  }

  void addFiles(List<String> paths) {
    final items = paths.map((p) => UploadItem(path: p)).toList();

    emit(state.copyWith(files: [...state.files, ...items]));

    for (final item in items) {
      _uploadFile(item);
    }
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

  void _updateItem(UploadItem item, {double? progress, UploadStatus? status}) {
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
}
