import 'package:flutter/material.dart';
import 'package:safety_app/features/Reports_register/views/widgets/Timer_container.dart';
import 'package:safety_app/features/Reports_register/views/widgets/custom_appbar.dart';
import 'package:safety_app/features/Reports_register/views/widgets/report_conatiner.dart';

class ReportPageViewBody extends StatelessWidget {
  const ReportPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAppbar(),
            SizedBox(height: 22),
            TimerContainer(),
            SizedBox(height: 25),
            SizedBox(
              height: 530,
              child: ListView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                children: [
                  ReportContainer(
                    reportText: "بلاغ تحرش",
                    processText: "قيد المعالجة",
                    processColor: Color.fromRGBO(237, 152, 7, 0.3),
                    processTextColor: Color(0xFFED9807),
                    timeText: "اليوم، 10:30 صباحاً",
                  ),
                  SizedBox(height: 15),
                  ReportContainer(
                    reportText: "بلاغ سرقة",
                    processText: "مكتمل",
                    processColor: Color.fromRGBO(73, 165, 63, 0.3),
                    processTextColor: Color(0xFF49A53F),
                    timeText: "امس، 8:15 مساءً",
                  ),
                  SizedBox(height: 15),
                  ReportContainer(
                    reportText: "بلاغ سرقة",
                    processText: "مكتمل",
                    processColor: Color.fromRGBO(73, 165, 63, 0.3),
                    processTextColor: Color(0xFF49A53F),
                    timeText: "امس، 8:15 مساءً",
                  ),
                  SizedBox(height: 15),
                  ReportContainer(
                    reportText: "بلاغ سرقة",
                    processText: "مكتمل",
                    processColor: Color.fromRGBO(73, 165, 63, 0.3),
                    processTextColor: Color(0xFF49A53F),
                    timeText: "امس، 8:15 مساءً",
                  ),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
