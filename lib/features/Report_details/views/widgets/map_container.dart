import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MapContainer extends StatelessWidget {
  const MapContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Container(
        width: 341,
        height: 251,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "الموقع",
                    style: GoogleFonts.almarai(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  ImageIcon(
                    AssetImage("assets/images/Icon (5).png"),
                    color: Color(0xFF174C8A),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Image.asset("assets/images/Frame 74163.png"),
            Text(
              "شارع الاردن, حي المنصور,عمان",
              style: GoogleFonts.almarai(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            Text(
              "35.952853,32.031343",
              style: GoogleFonts.almarai(
                fontSize: 14,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
