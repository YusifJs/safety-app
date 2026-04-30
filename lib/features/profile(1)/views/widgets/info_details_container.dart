import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoDetailsContainer extends StatelessWidget {
  const InfoDetailsContainer({
    super.key,
    required this.infoText,
    required this.detailText,
    required this.iconInfo,
  });

  final String infoText;
  final String detailText;
  final IconData iconInfo;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          children: [
            Text(
              infoText,
              style: GoogleFonts.almarai(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF103561),
              ),
            ),
            Text(
              detailText,
              style: GoogleFonts.almarai(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5B616D),
              ),
            ),
          ],
        ),
        SizedBox(width: 5),
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Color(0xFF174C8A),
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(child: Icon(iconInfo, color: Colors.white)),
        ),
      ],
    );
  }
}
