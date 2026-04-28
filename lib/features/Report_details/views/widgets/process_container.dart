import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProcessContainer extends StatelessWidget {
  const ProcessContainer({
    super.key,
    required this.processColor,
    required this.processText,
    required this.processTextColor,
  });

  final Color processColor;
  final String processText;
  final Color processTextColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: processColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        processText,
        style: GoogleFonts.almarai(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: processTextColor,
        ),
      ),
    );
  }
}
