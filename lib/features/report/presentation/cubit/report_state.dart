import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:safety_app/features/report/presentation/widgets/upload_model.dart';

class ReportState extends Equatable {
  final int currentStep;
  final bool isNow;
  final DateTime? date;
  final TimeOfDay? time;
  final LatLng? selectedLocation;
  final String? locationName;
  final String? selectedReportType;
  final List<UploadItem> images;
  final List<UploadItem> files;
  final bool isSubmitting;
  final bool isSubmitted;
  final String? errorMessage;

  const ReportState({
    this.currentStep = 1,
    this.isNow = true,
    this.date,
    this.time,
    this.selectedLocation,
    this.locationName,
    this.isSubmitting = false,
    this.isSubmitted = false,
    this.errorMessage,
    this.selectedReportType,
    this.images = const [],
    this.files = const [],
  });

  ReportState copyWith({
    int? currentStep,
    bool? isNow,
    DateTime? date,
    TimeOfDay? time,
    LatLng? selectedLocation,
    String? locationName,
    bool? isSubmitting,
    bool? isSubmitted,
    String? errorMessage,
    String? selectedReportType,
    List<UploadItem>? images,
    List<UploadItem>? files,
  }) {
    return ReportState(
      currentStep: currentStep ?? this.currentStep,
      isNow: isNow ?? this.isNow,
      date: date ?? this.date,
      time: time ?? this.time,
      selectedLocation: selectedLocation ?? this.selectedLocation,
      locationName: locationName ?? this.locationName,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSubmitted: isSubmitted ?? this.isSubmitted,
      errorMessage: errorMessage ?? this.errorMessage,
      selectedReportType: selectedReportType ?? this.selectedReportType,
      images: images ?? this.images,
      files: files ?? this.files,
    );
  }

  @override
  List<Object?> get props => [
    currentStep,
    isNow,
    date,
    time,
    selectedLocation,
    locationName,
    isSubmitting,
    isSubmitted,
    errorMessage,
    selectedReportType,
    images,
    files,
  ];
}
