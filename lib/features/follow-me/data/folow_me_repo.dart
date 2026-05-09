import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safety_app/features/follow-me/data/api_service.dart';

class MapRepository {
  final MapApiService apiService;
  final String _apiKey =
      "eyJvcmciOiI1YjNjZTM1OTc4NTExMTAwMDFjZjYyNDgiLCJpZCI6IjE2ZGZjOTEzMGNlNjQ1ZGNiYWRkMTJiNTUxNThjYmYxIiwiaCI6Im11cm11cjY0In0=";

  MapRepository(this.apiService);

  Future<List<LatLng>> getDirection(LatLng start, LatLng end) async {
    final response = await apiService.getRoute(
      _apiKey,
      "${start.longitude},${start.latitude}",
      "${end.longitude},${end.latitude}",
    );

    final coords = response.features[0].geometry.coordinates;
    return coords.map((c) => LatLng(c[1], c[0])).toList();
  }
}
