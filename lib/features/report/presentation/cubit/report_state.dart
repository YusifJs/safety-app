import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

class ReportState {
  final int currentStep;
  final bool isNow;
  final String? distance;
  final String? duration;
  final bool isLoadingRoute;
  final List<LatLng> routePoints;
  final LatLng? selectedLocation;
  final String? locationName;
  final bool isTripStarted;
  final int? remainingTime; 
  final int remainingSeconds; 
  final bool showSafetyCheck;
  final bool showAlmostFinishedDialog; 
  final DateTime? date;
  final TimeOfDay? time;

  const ReportState({
    this.currentStep = 1,
    this.isNow = true,
    this.distance,
    this.duration,
    this.isLoadingRoute = false,
    this.routePoints = const [],
    this.selectedLocation,
    this.locationName,
    this.isTripStarted = false,
    this.remainingTime,
    this.remainingSeconds = 0,
    this.showSafetyCheck = false,
    this.showAlmostFinishedDialog = false,
    this.date,
    this.time,
  });

  ReportState copyWith({
    int? currentStep,
    bool? isNow,
    String? distance,
    String? duration,
    bool? isLoadingRoute,
    List<LatLng>? routePoints,
    LatLng? selectedLocation,
    String? locationName,
    bool? isTripStarted,
    int? remainingTime,
    int? remainingSeconds,
    bool? showSafetyCheck,
    bool? showAlmostFinishedDialog,
    DateTime? date,
    TimeOfDay? time,
  }) {
    return ReportState(
      currentStep: currentStep ?? this.currentStep,
      isNow: isNow ?? this.isNow,
      distance: distance ?? this.distance,
      duration: duration ?? this.duration,
      isLoadingRoute: isLoadingRoute ?? this.isLoadingRoute,
      routePoints: routePoints ?? this.routePoints,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      locationName: locationName ?? this.locationName,
      isTripStarted: isTripStarted ?? this.isTripStarted,
      remainingTime: remainingTime ?? this.remainingTime,
      remainingSeconds: remainingSeconds ?? this.remainingSeconds,
      showSafetyCheck: showSafetyCheck ?? this.showSafetyCheck,
      showAlmostFinishedDialog:
          showAlmostFinishedDialog ?? this.showAlmostFinishedDialog,
      date: date ?? this.date,
      time: time ?? this.time,
    );
  }
}
