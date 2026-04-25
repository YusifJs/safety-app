import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class ReportState extends Equatable {
  final int currentStep;
  final bool isNow;
  final DateTime? date;
  final TimeOfDay? time;
  final LatLng? selectedLocation;
  final String? locationName;

  const ReportState({
    this.currentStep = 2,
    this.isNow = true,
    this.date,
    this.time,
    this.selectedLocation,
    this.locationName,
  });

  ReportState copyWith({
    int? currentStep,
    bool? isNow,
    DateTime? date,
    TimeOfDay? time,
    LatLng? selectedLocation,
    String? locationName,
  }) {
    return ReportState(
      currentStep: currentStep ?? this.currentStep,
      isNow: isNow ?? this.isNow,
      date: date ?? this.date,
      time: time ?? this.time,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      locationName: locationName ?? this.locationName,
    );
  }

  @override
  List<Object?> get props => [currentStep, isNow, date, time, selectedLocation, locationName];
}
