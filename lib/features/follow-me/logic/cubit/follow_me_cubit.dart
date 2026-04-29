import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter/material.dart';
import 'follow_me_state.dart';

class RafiqnyCubit extends Cubit<RafiqnyState> {
  RafiqnyCubit() : super(RafiqnyInitial());

  Future<void> checkSubscriptionStatus() async {
    emit(RafiqnyLoading());
    await Future.delayed(const Duration(seconds: 1));

    bool isPremium = false;

    emit(RafiqnyNotSubscribed());
  }

  void getRouteToDestination(LatLng start, LatLng destination) async {
    if (state is RafiqnySubscribed) {
      final currentState = state as RafiqnySubscribed;

      emit(
        RafiqnySubscribed(
          currentUserLocation: start,
          routePoints: [],
          markers: [
            Marker(
              point: start,
              child: const Icon(Icons.my_location, color: Colors.blue),
            ),
            Marker(
              point: destination,
              child: const Icon(Icons.location_on, color: Colors.red),
            ),
          ],
        ),
      );
    }
  }
}
