import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AlertsContainer extends StatelessWidget {
  const AlertsContainer({
    super.key,
    required this.shadowColor,
    required this.alertType,
    required this.alerttext,
    required this.alertTime,
    required this.iconColor,
    required this.iconImage,
    required this.imageColor,
  });

  final Color shadowColor;
  final String alertType;
  final String alerttext;
  final String alertTime;
  final Color iconColor;
  final String iconImage;
  final Color imageColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: 320,
        height: 157,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: shadowColor, blurRadius: 0, offset: Offset(6, 0)),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    alertType,
                    style: GoogleFonts.almarai(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 5),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: iconColor,
                    ),
                    child: Center(
                      child: ImageIcon(
                        AssetImage(iconImage),
                        color: imageColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 28),
              child: Text(
                alerttext,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.almarai(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF5B616D),
                ),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 28),
              child: Text(
                alertTime,
                style: GoogleFonts.almarai(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Color(0xFF5B616D),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
