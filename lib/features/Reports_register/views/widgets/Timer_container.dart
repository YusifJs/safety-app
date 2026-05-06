import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerContainer extends StatelessWidget {
  const TimerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 337,
        height: 55,
        decoration: BoxDecoration(
          color: Color.fromRGBO(23, 76, 138, 0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Text(
              "يتم الاحتفاظ بسجل البلاغات لمدة 5 سنوات",
              style: GoogleFonts.almarai(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Color(0xFF174C8A),
              ),
            ),
            SizedBox(width: 5),
            ImageIcon(
              AssetImage("assets/images/Icon (2).png"),
              size: 22,
              color: Color(0xFF174C8A),
            ),
          ],
        ),
      ),
    );
  }
}
