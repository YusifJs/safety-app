import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_app/features/profile(1)/views/widgets/custom_profile(1)_app_bar.dart';
import 'package:safety_app/features/profile(1)/views/widgets/info_container.dart';
import 'package:safety_app/features/profile(1)/views/widgets/notifi_container.dart';
import 'package:safety_app/features/profile(1)/views/widgets/profile_picture.dart';
import 'package:safety_app/features/profile(1)/views/widgets/settings_container.dart';

class Profile1ViewBody extends StatelessWidget {
  const Profile1ViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomProfileAppbar(),
            SizedBox(height: 8),
            NotifiContainer(),
            SizedBox(height: 15),
            ProfilePicture(),
            Text(
              "احمد علي صافي",
              style: GoogleFonts.almarai(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF174C8A),
              ),
            ),
            SizedBox(height: 8),
            InfoContainer(),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 74,
                    height: 23,
                    decoration: BoxDecoration(
                      color: Color(0xFF174C8A),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImageIcon(
                          AssetImage("assets/images/Vector (5).png"),
                          color: Colors.white,
                          size: 12,
                        ),
                        Text(
                          "اضافة  +",
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.almarai(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "المواقع المحفوظة",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.almarai(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              width: 162,
              height: 76,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add, color: Color(0xFF103561)),
                ),
              ),
            ),
            SizedBox(height: 5),
            SettingsContainer(
              settingsText: "إعدادات الإشعارات",
              iconSettings: Icons.notifications,
            ),
            SizedBox(height: 5),
            SettingsContainer(
              settingsText: "خطط الدفع والاشتراك",
              iconSettings: Icons.wallet,
            ),
            SizedBox(height: 5),
            SettingsContainer(
              settingsText: "اعدادات الحماية",
              iconSettings: Icons.key_outlined,
            ),
            SizedBox(height: 10),
            SizedBox(
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
                  "تسجيل خروج",
                  style: GoogleFonts.almarai(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
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
