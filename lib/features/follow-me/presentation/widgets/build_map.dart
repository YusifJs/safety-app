import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:safety_app/features/report/presentation/cubit/report_cubit.dart';
import 'package:safety_app/features/report/presentation/cubit/report_state.dart';

Widget buildMap(BuildContext context, ReportState state) {
  return FlutterMap(
    options: MapOptions(
      initialCenter: const LatLng(30.46, 31.18),
      initialZoom: 15,
      onTap: (tapPos, point) {
        if (!state.isTripStarted) {
          context.read<ReportCubit>().setLocation(point);
        }
      },
    ),
    children: [
      TileLayer(
        urlTemplate:
            'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
      ),
      if (state.routePoints.isNotEmpty)
        PolylineLayer(
          polylines: [
            Polyline(
              points: state.routePoints,
              color: Colors.blueAccent,
              strokeWidth: 5,
            ),
          ],
        ),
      if (state.selectedLocation != null)
        MarkerLayer(
          markers: [
            Marker(
              point: state.selectedLocation!,
              child: const Icon(Icons.location_on, color: Colors.red, size: 40),
            ),
          ],
        ),
    ],
  );
}
