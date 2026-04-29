import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapPickerPage extends StatefulWidget {
  const MapPickerPage({super.key});

  @override
  State<MapPickerPage> createState() => _MapPickerPageState();
}

class _MapPickerPageState extends State<MapPickerPage> {
  final MapController mapController = MapController();

  LatLng? selectedPoint;

  final LatLng defaultCenter = const LatLng(30.0444, 31.2357); // Default: Cairo

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) return;

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition();

    final newPoint = LatLng(position.latitude, position.longitude);

    if (!mounted) return;

    setState(() {
      selectedPoint = newPoint;
    });

    mapController.move(newPoint, 16);
  }

  void confirmLocation() {
    if (selectedPoint != null) {
      Navigator.pop(context, selectedPoint);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Location"),

        actions: [
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: getCurrentLocation,
          ),
        ],
      ),

      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: selectedPoint ?? defaultCenter,
              initialZoom: 13,

              interactionOptions: const InteractionOptions(
                flags: InteractiveFlag.all,
              ),

              onTap: (tapPosition, point) {
                if (!mounted) return;

                setState(() {
                  selectedPoint = point;
                });
              },
            ),

            children: [
              TileLayer(
                urlTemplate:
                    "https://basemaps.cartocdn.com/rastertiles/voyager/{z}/{x}/{y}.png",
              ),

              MarkerLayer(
                markers: selectedPoint == null
                    ? []
                    : [
                        Marker(
                          point: selectedPoint!,
                          width: 45,
                          height: 45,
                          child: const Icon(
                            Icons.location_pin,
                            size: 45,
                            color: Colors.red,
                          ),
                        ),
                      ],
              ),
            ],
          ),

          if (selectedPoint != null)
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: ElevatedButton(
                onPressed: confirmLocation,
                child: const Text("Confirm Location"),
              ),
            ),
        ],
      ),
    );
  }
}
