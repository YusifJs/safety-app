import 'package:equatable/equatable.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

abstract class RafiqnyState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RafiqnyInitial extends RafiqnyState {}

class RafiqnyLoading extends RafiqnyState {}

class RafiqnyNotSubscribed extends RafiqnyState {}

class RafiqnySubscribed extends RafiqnyState {
  final List<Marker> markers;
  final List<LatLng> routePoints;
  final LatLng? currentUserLocation;

  RafiqnySubscribed({
    this.markers = const [],
    this.routePoints = const [],
    this.currentUserLocation,
  });

  @override
  List<Object?> get props => [markers, routePoints, currentUserLocation];
}

class RafiqnyError extends RafiqnyState {
  final String message;
  RafiqnyError(this.message);
}
