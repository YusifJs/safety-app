class RoutingResponse {
  final List<Feature> features;
  RoutingResponse({required this.features});

  factory RoutingResponse.fromJson(Map<String, dynamic> json) =>
      RoutingResponse(
        features: (json['features'] as List)
            .map((i) => Feature.fromJson(i))
            .toList(),
      );
}

class Feature {
  final Geometry geometry;
  Feature({required this.geometry});

  factory Feature.fromJson(Map<String, dynamic> json) =>
      Feature(geometry: Geometry.fromJson(json['geometry']));
}

class Geometry {
  final List<dynamic> coordinates;
  Geometry({required this.coordinates});

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      Geometry(coordinates: json['coordinates']);
}
