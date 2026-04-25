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
                onPressed: () {
                  if (state.currentStep > 1) {
                    cubit.previousStep();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: const Text("رجوع", style: TextStyle(color: Colors.blue)),
              ),
            ),

            const SizedBox(width: 10),

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
                  if (state.currentStep < 3) {
                    cubit.nextStep();
                  }
                },
                child: Text(
                  style: TextStyle(color: Colors.white),
                  state.currentStep == 3 ? "إنهاء" : "التالي",
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
