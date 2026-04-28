import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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

        return Row(
          children: [
            // BACK BUTTON
            if (!isFirstStep)
              Expanded(
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    side: const BorderSide(color: Colors.blue),
                  ),
                  onPressed: () {
                    cubit.previousStep();
                  },
                  child: const Text(
                    "رجوع",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ),

            if (!isFirstStep) const SizedBox(width: 10),

            // MAIN BUTTON
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  if (isLastStep) {
                    // submit action
                    cubit.submitReport(); // لو عندك function
                  } else {
                    cubit.nextStep();
                  }
                },
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