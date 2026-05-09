import 'package:flutter/material.dart';
import 'package:safety_app/features/report/presentation/cubit/report_cubit.dart';
import 'package:safety_app/features/report/presentation/cubit/report_state.dart';
import 'package:safety_app/features/report/presentation/pages/step1Content.dart';
import 'package:safety_app/features/report/presentation/pages/step2Content.dart';
import 'package:safety_app/features/report/presentation/pages/step3Content.dart';
import 'package:safety_app/features/report/presentation/widgets/action_buttons.dart';
import 'package:safety_app/features/report/presentation/widgets/app_bar.dart';
import 'package:safety_app/features/report/presentation/widgets/stepper_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/features/widgets/custom_dialog.dart';

class ReportPagesController extends StatelessWidget {
  const ReportPagesController({super.key});
  static const String routeName = '/reportScreenController';

  String getAppBarTitle(int step) {
    switch (step) {
      case 1:
        return "بلاغ جديد";
      case 2:
        return "موقع البلاغ";
      case 3:
        return "إرسال البلاغ";
      default:
        return "";
    }
  }

  String getStepTitle(int step) {
    switch (step) {
      case 1:
        return "ما هو نوع البلاغ؟";
      case 2:
        return "حدد الموقع والوقت";
      case 3:
        return "تفاصيل البلاغ";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ReportCubit(),
      child: BlocListener<ReportCubit, ReportState>(
        listenWhen: (prev, curr) =>
            prev.submitEventId != curr.submitEventId && curr.submitEventId > 0,
        listener: (context, state) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return CustomDialog(
                dialogImage: Icon(Icons.done, color: Colors.green),
                title: "تم استلام بلاغك بنجاح",
                button1: "متابعة البلاغ",
                button2: "الرئيسية",
              );
            },
          );
        },
        child: BlocBuilder<ReportCubit, ReportState>(
          builder: (context, state) {
            return Scaffold(
              backgroundColor: Colors.grey[100],
              appBar: ReportAppBar(
                appBarTitle: getAppBarTitle(state.currentStep),
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const StepperWidget(),
                      const SizedBox(height: 20),

                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          getStepTitle(state.currentStep),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      Expanded(child: _buildStep(state.currentStep)),

                      const SizedBox(height: 10),

                      const ActionButtons(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

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
}
