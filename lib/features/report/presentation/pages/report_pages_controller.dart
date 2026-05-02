import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/features/widgets/notification_button.dart';
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

                    _buildTitleAndStep(state.currentStep),

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

  // ================= STEP CONTENT =================
  Widget _buildStep(int step) {
    switch (step) {
      case 1:
        return const Step1Content();

      case 2:
        return const Step2Content();

      case 3:
        return const Step3Content();

      default:
        return const SizedBox();
    }
  }

  // ================= TITLE (CASE BASED) =================

  Widget _buildTitleAndStep(int step) {
    switch (step) {
      case 1:
        return Column(
          children: [
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: Text(
                "ما هو نوع البلاغ؟",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );

      case 2:
        return Column(
          children: const [
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: Text(
                "حدد الموقع والوقت",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );

      case 3:
        return Column(
          children: const [
            Align(
              alignment: AlignmentGeometry.centerRight,
              child: Text(
                "تفاصيل البلاغ",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        );

      default:
        return const SizedBox();
    }
  }
}

// ================= HEADER =================
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          const Row(
            children: [
              Icon(Icons.arrow_back),
              SizedBox(width: 6),
              Image(
                image: AssetImage('assets/bird.png'),
                width: 40,
                height: 40,
              ),
              SizedBox(width: 6),
              Text("بلاغ عام", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Spacer(),
          NotificationButton(),
        ],
      ),
    );
  }
}
