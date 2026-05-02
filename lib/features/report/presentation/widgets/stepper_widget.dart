import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import '../cubit/report_cubit.dart';
import '../cubit/report_state.dart';

class StepperWidget extends StatelessWidget {
  const StepperWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        return Row(
          children: [
            _step(1, state.currentStep),
            _line(1, state.currentStep),
            _step(2, state.currentStep),
            _line(2, state.currentStep),
            _step(3, state.currentStep),
          ],
        );
      },
    );
  }

  Widget _step(int step, int current) {
    final isActive = step == current;
    final isDone = step < current;

    return Container(
      width: 40,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive || isDone ? AppColors.blue : AppColors.white,
        shape: BoxShape.circle,
      ),
      child: isDone
          ? const Icon(Icons.check, color: Colors.white, size: 20)
          : Text(
              "$step",
              style: TextStyle(
                color: isActive ? AppColors.white : AppColors.darkGrey,
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }

  Widget _line(int step, int current) {
    final isActive = step < current;

    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 6),
        height: 4,
        decoration: BoxDecoration(
          color: isActive ? AppColors.blue : AppColors.white,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
