import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:safety_app/features/report/presentation/cubit/report_cubit.dart';
import 'package:safety_app/features/report/presentation/cubit/report_state.dart';

void showRouteDetailsBottomSheet(BuildContext context, ReportState state) {
  final reportCubit = context.read<ReportCubit>();

  showModalBottomSheet(
    context: context,
    isDismissible: false,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (innerContext) => BlocProvider.value(
      value: reportCubit,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              state.locationName ?? "موقع محدد",
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildTripInfoItem("الوقت المتوقع", state.duration ?? "--"),
                buildTripInfoItem("المسافة", state.distance ?? "--"),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                reportCubit.startTrip();
                Navigator.pop(innerContext);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "بدء الرحلة",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget buildTripInfoItem(String label, String value) {
  return Column(
    children: [
      Text(label, style: const TextStyle(color: Colors.grey)),
      Text(
        value,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
          fontSize: 16,
        ),
      ),
    ],
  );
}

Widget buildHeader(BuildContext context) {
  return Positioned(
    top: 50,
    left: 20,
    child: CircleAvatar(
      backgroundColor: Colors.white,
      child: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => Navigator.pop(context),
      ),
    ),
  );
}
