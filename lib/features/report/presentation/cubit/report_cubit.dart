import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
}
