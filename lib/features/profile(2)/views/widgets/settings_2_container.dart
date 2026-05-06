import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsSecondContainer extends StatelessWidget {
  const SettingsSecondContainer({
    super.key,
    required this.settingsText,
    required this.iconSettings,
  });

  final String settingsText;
  final IconData iconSettings;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: EdgeInsets.all(8),
        width: 343,
        height: 68,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
            Expanded(
              child: Text(
                settingsText,
                textAlign: TextAlign.right,
                style: GoogleFonts.almarai(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(width: 5),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Color(0xFF174C8A),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(child: Icon(iconSettings, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
