import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AttachContainer extends StatelessWidget {
  const AttachContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 338,
        height: 159,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "المرفقات",
                style: GoogleFonts.almarai(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(thickness: 1, color: Color(0xFF949494)),
            Image.asset("assets/images/Rectangle 2374.png"),
          ],
        ),
      ),
    );
  }
}
