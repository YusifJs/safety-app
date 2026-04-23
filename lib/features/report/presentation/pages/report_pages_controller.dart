import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/report_cubit.dart';
import '../cubit/report_state.dart';
import '../pages/step1Content.dart';
import '../pages/step2Content.dart';
import '../pages/step3Content.dart';
import '../widgets/stepper_widget.dart';
import '../widgets/action_buttons.dart';

class ReportPagesController extends StatelessWidget {
  const ReportPagesController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportCubit(),
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: SafeArea(
          child: BlocBuilder<ReportCubit, ReportState>(
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const _Header(),

                    const SizedBox(height: 20),

                    const StepperWidget(),

                    const SizedBox(height: 20),

                    _buildTitle(state.currentStep),

                    const SizedBox(height: 10),

                    Expanded(child: _buildStep(state.currentStep)),

                    const ActionButtons(),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildStep(int step) {
    switch (step) {
      case 1:
        return const Step1Content();

      case 2:
        return const Step2content();

      case 3:
        return const Step3Content();

      default:
        return const SizedBox();
    }
  }

  Widget _buildTitle(int step) {
    if (step != 2) return const SizedBox();

    return const Align(
      alignment: Alignment.centerRight,
      child: Text(
        "حدد الموقع و الوقت",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Notification
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.notifications_none),
        ),

        const Spacer(),

        Row(
          children: const [
            Text("بلاغ عام", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 6),
            Icon(Icons.arrow_forward),
          ],
        ),
      ],
    );
  }
}
