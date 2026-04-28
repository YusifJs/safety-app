import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_app/features/Report_details/views/widgets/attach_container.dart';
import 'package:safety_app/features/Report_details/views/widgets/custom_details_appbar.dart';
import 'package:safety_app/features/Report_details/views/widgets/map_container.dart';
import 'package:safety_app/features/Report_details/views/widgets/process_container.dart';
import 'package:safety_app/features/Report_details/views/widgets/report_details_container.dart';
import 'package:safety_app/features/Report_details/views/widgets/report_steps.dart';

class ReportDetailsViewBody extends StatelessWidget {
  const ReportDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomDetailsAppbar(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ProcessContainer(
                    processColor: Color.fromRGBO(237, 152, 7, 0.3),
                    processText: "قيد المعالجة",
                    processTextColor: Color(0xFFED9807),
                  ),
                  Column(
                    children: [
                      Text(
                        "رقم البلاغ",
                        style: GoogleFonts.almarai(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF949494),
                        ),
                      ),
                      Text(
                        "#4092",
                        style: GoogleFonts.almarai(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            ReportDeatilsContainer(reportText: "بلاغ تحرش"),
            SizedBox(height: 8),
            MapContainer(),
            SizedBox(height: 5),
            ReportSteps(),
            SizedBox(height: 5),
            AttachContainer(),
          ],
        ),
      ),
    );
  }
}
