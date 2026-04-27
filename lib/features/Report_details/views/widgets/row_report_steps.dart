import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RowReportSteps extends StatelessWidget {
  const RowReportSteps({
    super.key,
    required this.stepText,
    required this.stepTime,
    required this.colorLine,
    required this.colorIcon,
    this.isLast = false,
  });

  final String stepText;
  final String stepTime;
  final Color colorLine;
  final Color colorIcon;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                stepText,
                style: GoogleFonts.almarai(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                stepTime,
                style: GoogleFonts.almarai(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF174C8A),
                ),
              ),
            ],
          ),
        ),
        Column(
          children: [
            ImageIcon(
              AssetImage("assets/images/Icon (6).png"),
              color: colorIcon,
            ),
            if (!isLast) Container(width: 2, height: 70, color: colorLine),
          ],
        ),
      ],
    );
  }
}
