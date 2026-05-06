import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_app/features/notification_settings/views/widgets/noti_custom_app_bar.dart';
import 'package:safety_app/features/notification_settings/views/widgets/notifications_container.dart';

class NotiSettingsViewBody extends StatelessWidget {
  const NotiSettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            NotiCustomAppBar(),
            SizedBox(height: 8),
            Container(
              width: 63,
              height: 60,
              decoration: BoxDecoration(
                color: Color(0xFF174C8A),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Icon(Icons.notifications, color: Colors.white),
              ),
            ),
            Text(
              "تحكم في التنبيهات التي تصلك",
              style: GoogleFonts.almarai(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 15),
            NotificationsContainer(
              isFirst: true,
              setText: "اشعارات طارئة",
              typeText: "تنبيهات SOS",
              descText: "اشعارات فورية للطوارئ",
              iconNoti: Icons.error_outline,
              contColor: const Color.fromARGB(255, 238, 160, 160),
              iconColor: Colors.redAccent,
            ),
            SizedBox(height: 5),
            NotificationsContainer(
              typeText: "تحديثات البلاغات",
              descText: "حالة البلاغ ",
              iconNoti: Icons.messenger_outline_outlined,
              contColor: Color.fromARGB(255, 194, 218, 245),
              iconColor: Color(0xFF174C8A),
            ),
            SizedBox(height: 5),
            NotificationsContainer(
              typeText: "رافقني",
              descText: "تنبيهات الوقت والوصول",
              iconNoti: Icons.alarm,
              contColor: const Color.fromARGB(255, 245, 217, 209),
              iconColor: Colors.deepOrangeAccent,
            ),
            SizedBox(height: 10),
            NotificationsContainer(
              isFirst: true,
              setText: "اشعارات عامة",
              typeText: "تنبيهات تحذيرية",
              descText: "تنبيهات المواقع المحفوظة",
              iconNoti: Icons.location_pin,
              contColor: const Color.fromARGB(255, 238, 160, 160),
              iconColor: Colors.redAccent,
            ),
            SizedBox(height: 5),
            NotificationsContainer(
              typeText: "رسائل المحادثة الصامتة",
              descText: "اشعارات البلاغ الصامت",
              iconNoti: Icons.messenger_outline_outlined,
              contColor: Color.fromARGB(255, 194, 218, 245),
              iconColor: Color(0xFF174C8A),
            ),
          ],
        ),
      ),
    );
  }
}
