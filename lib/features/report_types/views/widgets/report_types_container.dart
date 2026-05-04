import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportTypesContainer extends StatelessWidget {
  const ReportTypesContainer({
    super.key,
    required this.typeText,
    required this.detailText,
    required this.iconImage,
  });

  final String typeText;
  final String detailText;
  final IconData iconImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 319,
        height: 69,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  typeText,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.almarai(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF174C8A),
                  ),
                ),
                Text(
                  detailText,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.almarai(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF174C8A),
                  ),
                ),
              ],
            ),
            SizedBox(width: 5),
            Icon(iconImage, color: Color(0xFF174C8A), size: 20),
          ],
        ),
      ),
    );
  }
}
