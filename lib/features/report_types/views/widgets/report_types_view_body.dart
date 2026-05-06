import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_app/features/report_types/views/widgets/custom_types_app_bar.dart';
import 'package:safety_app/features/report_types/views/widgets/report_types_container.dart';

class ReportTypesViewBody extends StatelessWidget {
  const ReportTypesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTypesAppBar(),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Text(
                "اختر الطريقة الانسب لمساعدتك",
                style: GoogleFonts.almarai(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 8),
            ReportTypesContainer(
              typeText: "بلاغ مرئي ",
              detailText: "للصم لتحليل لغة الاشارة",
              iconImage: Icons.circle_rounded,
            ),
            SizedBox(height: 8),
            ReportTypesContainer(
              typeText: "بلاغ صوتي ",
              detailText: "للتحدث مباشرة مع الشرطة",
              iconImage: Icons.phone,
            ),
            SizedBox(height: 8),
            ReportTypesContainer(
              typeText: "بلاغ صامت ",
              detailText: "للبلاغ السري عبر الكلمة السرية",
              iconImage: Icons.lock,
            ),
            SizedBox(height: 150),
            Center(
              child: SizedBox(
                width: 240,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF174C8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "تأكيد",
                    style: GoogleFonts.almarai(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
