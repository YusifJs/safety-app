import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceContainer extends StatelessWidget {
  const PlaceContainer({
    super.key,
    required this.placeText,
    required this.addressText,
  });

  final String placeText;
  final String addressText;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 163,
      height: 77,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    placeText,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.almarai(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    addressText,
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.almarai(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF4A4A4A),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 4),
            Container(
              width: 43,
              height: 43,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 186, 209, 243),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.location_on_outlined,
                color: Color(0xFF0052CC),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
