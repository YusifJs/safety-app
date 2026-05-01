import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_app/features/profile(2)/views/widgets/custom_profile(2)_app_bar.dart';
import 'package:safety_app/features/profile(2)/views/widgets/info_2_container.dart';
import 'package:safety_app/features/profile(2)/views/widgets/place_container.dart';
import 'package:safety_app/features/profile(2)/views/widgets/profile_2_picture.dart';
import 'package:safety_app/features/profile(2)/views/widgets/settings_2_container.dart';

class ProfileSecondPageViewBody extends StatelessWidget {
  const ProfileSecondPageViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSecondProfileAppbar(),
            SizedBox(height: 10),
            ProfileSecondPicture(),
            Text(
              "احمد علي صافي",
              style: GoogleFonts.almarai(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF174C8A),
              ),
            ),
            SizedBox(height: 8),
            InfoSecondContainer(),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 74,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Color(0xFF174C8A),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add, color: Colors.white, size: 14),
                          Text(
                            "اضافة",
                            style: GoogleFonts.almarai(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
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
                        Text(
                          "ستصلك التنبيهات من جميع المواقع المحفوظة",
                          textAlign: TextAlign.right,
                          textDirection: TextDirection.rtl,
                          style: GoogleFonts.almarai(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF737373),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  PlaceContainer(
                    placeText: "العمل",
                    addressText: "طريق الملك فهد",
                  ),
                  SizedBox(width: 5),
                  PlaceContainer(placeText: "المنزل", addressText: "حي الملقا"),
                ],
              ),
            ),
            SizedBox(height: 5),
            SettingsSecondContainer(
              settingsText: "إعدادات الإشعارات",
              iconSettings: Icons.notifications,
            ),
            SizedBox(height: 5),
            SettingsSecondContainer(
              settingsText: "خطط الدفع والاشتراك",
              iconSettings: Icons.wallet,
            ),
            SizedBox(height: 5),
            SettingsSecondContainer(
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
