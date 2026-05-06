import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_app/features/alerts/views/widgets/alerts_container.dart';
import 'package:safety_app/features/alerts/views/widgets/alerts_map_container.dart';
import 'package:safety_app/features/alerts/views/widgets/custom_alerts_appbar.dart';

class AlertsViewBody extends StatelessWidget {
  const AlertsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            CustomAlertsAppbar(),
            AlertsMapContainer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "التنبيهات الأخيرة",
                    style: GoogleFonts.almarai(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ImageIcon(
                    AssetImage("assets/images/Icon (7).png"),
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            AlertsContainer(
              shadowColor: Colors.red,
              alertType: "تحذير من سرقة في المنطقة",
              alerttext:
                  "تم رصد محاولات سرقة متكررة في حي الزهور. يرجى توخي الحذر وإبلاغ الشرطة عن أي نشاط مشبوه.",
              alertTime: "منذ 5 دقائق",
              iconColor: Color(0xFFFEF2F2),
              iconImage: 'assets/images/Vector (3).png',
              imageColor: Color(0xFFEB1A1A),
            ),
            AlertsContainer(
              shadowColor: Color(0xFFED9807),
              alertType: "حادث مروري على الطريق السريع",
              alerttext:
                  "حادث مروري بسيط على الطريق السريع بالقرب من مخرج 12. الحركة المرورية بطيئة.",
              alertTime: "منذ 15 دقيقة",
              iconColor: Color(0xFFFEFCE8),
              iconImage: 'assets/images/Icon (8).png',
              imageColor: Color(0xFFED9807),
            ),
          ],
        ),
      ),
    );
  }
}
