import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:safety_app/features/report/presentation/cubit/report_cubit.dart';

Widget buildSafetyCheckOverlay(BuildContext context) {
  return Container(
    color: Colors.black87,

    child: Center(
      child: Container(
        margin: const EdgeInsets.all(30),

        padding: const EdgeInsets.all(24),

        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            const Icon(
              Icons.warning_amber_rounded,
              size: 60,
              color: Colors.red,
            ),

            const SizedBox(height: 16),

            const Text(
              "هل أنت بخير؟",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            const Text(
              "انتهى الوقت المحدد ولم يتم تأكيد الوصول. تم إرسال بلاغ تلقائي للجهات المعنية.",

              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () => context.read<ReportCubit>().finishTrip(),

              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),

              child: const Text(
                "أنا بخير، ألغِ البلاغ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
