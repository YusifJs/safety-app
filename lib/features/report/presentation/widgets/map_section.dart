import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:latlong2/latlong.dart';
import '../cubit/report_cubit.dart';
import '../cubit/report_state.dart';
import '../pages/map_picker_page.dart';

class MapSection extends StatelessWidget {
  const MapSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final LatLng? result = await Navigator.push(
          context,
          MaterialPageRoute(builder: (ctx) => const MapPickerPage()),
        );

        if (result != null) {
          context.read<ReportCubit>().setLocation(result);
        }
      },

      // 👇 هنا الحل
      child: BlocBuilder<ReportCubit, ReportState>(
        builder: (context, state) {
          return Container(
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: const DecorationImage(
                image: AssetImage("assets/images/default-marker.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.black.withOpacity(0.2),
              ),
              child: Center(
                child: state.selectedLocation == null
                    ? const Icon(
                        Icons.location_on,
                        size: 40,
                        color: Colors.white,
                      )
                    : Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          state.locationName ?? "Unknown Location",
                          textAlign: TextAlign.center,
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
