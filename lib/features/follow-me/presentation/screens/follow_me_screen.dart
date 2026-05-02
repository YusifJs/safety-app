import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/features/follow-me/presentation/widgets/buildActiveTripUI.dart';
import 'package:safety_app/features/follow-me/presentation/widgets/buildAlmostFinishedOverlay.dart';
import 'package:safety_app/features/follow-me/presentation/widgets/buildSafetyCheckOverlay.dart';

import 'package:safety_app/features/follow-me/presentation/widgets/build_map.dart';
import 'package:safety_app/features/follow-me/presentation/widgets/showRouteDetailsBottomSheet.dart';
import 'package:safety_app/features/report/presentation/cubit/report_cubit.dart';
import 'package:safety_app/features/report/presentation/cubit/report_state.dart';

class RafiqnyMapScreen extends StatelessWidget {
  const RafiqnyMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportCubit(),
      child: Scaffold(
        body: BlocConsumer<ReportCubit, ReportState>(
          listener: (context, state) {
            if (state.distance != null &&
                !state.isLoadingRoute &&
                !state.isTripStarted) {
              showRouteDetailsBottomSheet(context, state);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                buildMap(context, state),

                if (!state.isTripStarted) buildHeader(context),

                if (state.isTripStarted) buildActiveTripUI(context, state),

                if (state.showAlmostFinishedDialog)
                  buildAlmostFinishedOverlay(context, state),

                if (state.showSafetyCheck) buildSafetyCheckOverlay(context),

                if (state.isLoadingRoute)
                  const Center(child: CircularProgressIndicator()),
              ],
            );
          },
        ),
      ),
    );
  }
}
