import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import '../cubit/report_cubit.dart';
import '../cubit/report_state.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        final cubit = context.read<ReportCubit>();

        final isFirstStep = state.currentStep == 1;
        final isLastStep = state.currentStep == 3;

        final canGoNext = state.currentStep == 1
            ? state.selectedReportType != null
            : true;

        if (isFirstStep) {
          return Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ).copyWith(
                      backgroundColor: WidgetStateProperty.resolveWith((
                        states,
                      ) {
                        if (states.contains(WidgetState.disabled)) {
                          return AppColors.blue.withValues(alpha: 0.3);
                        }
                        return AppColors.blue;
                      }),
                    ),
                onPressed: canGoNext ? () => cubit.nextStep() : null,
                child: const Text(
                  "التالي",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          );
        }

        return Row(
          children: [
            Expanded(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  side: const BorderSide(color: Colors.blue),
                ),
                onPressed: () => cubit.previousStep(),
                child: const Text("رجوع", style: TextStyle(color: Colors.blue)),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ).copyWith(
                      backgroundColor: WidgetStateProperty.resolveWith((
                        states,
                      ) {
                        if (states.contains(WidgetState.disabled)) {
                          return AppColors.blue.withValues(alpha: 0.3);
                        }
                        return AppColors.blue;
                      }),
                    ),
                onPressed: canGoNext
                    ? () {
                        if (isLastStep) {
                          cubit.submitReport();
                        } else {
                          cubit.nextStep();
                        }
                      }
                    : null,
                child: Text(
                  isLastStep ? "إرسال" : "التالي",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
