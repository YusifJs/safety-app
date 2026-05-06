import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_app/features/Report_details/views/widgets/row_report_steps.dart';

class ReportSteps extends StatelessWidget {
  const ReportSteps({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Container(
        width: 340,
        height: 490,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "مسار البلاغ",
              style: GoogleFonts.almarai(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            RowReportSteps(
              stepText: "تم استلام البلاغ",
              stepTime: "10:30 صباحاً",
              colorLine: Color(0xFF174C8A),
              colorIcon: Color(0xFF174C8A),
            ),
            RowReportSteps(
              stepText: "توجيه أقرب دورية",
              stepTime: "10:32 صباحاً",
              colorLine: Color(0xFF174C8A),
              colorIcon: Color(0xFF174C8A),
            ),
            RowReportSteps(
              stepText: "الدورية في الطريق",
              stepTime: "جاري الآن",
              colorLine: Color(0xFF949494),
              colorIcon: Color(0xFFED9807),
            ),
            RowReportSteps(
              stepText: "الوصول للموقع",
              stepTime: "--",
              colorLine: Color(0xFF949494),
              colorIcon: Color(0xFF949494),
            ),
            RowReportSteps(
              stepText: "إغلاق البلاغ",
              stepTime: "--",
              colorLine: Color(0xFF949494),
              colorIcon: Color(0xFF949494),
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}
