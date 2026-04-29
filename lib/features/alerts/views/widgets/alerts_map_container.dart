import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_app/features/alerts/views/widgets/search_container.dart';

class AlertsMapContainer extends StatelessWidget {
  const AlertsMapContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 393,
      height: 348,
      child: Stack(
        children: [
          Image.asset("assets/images/5663353_2954453 1.png"),
          Positioned(top: 15, left: 0, right: 0, child: SearchContainer()),
          Positioned(
            top: 60,
            left: 120,
            width: 60,
            height: 60,
            child: Image.asset("assets/images/Container.png"),
          ),
          Positioned(
            top: 90,
            right: 80,
            width: 60,
            height: 60,
            child: Image.asset("assets/images/Container.png"),
          ),
          Positioned(
            top: 160,
            left: 70,
            width: 60,
            height: 60,
            child: Image.asset("assets/images/Container (1).png"),
          ),
          Positioned(
            top: 190,
            left: 30,
            width: 60,
            height: 60,
            child: Image.asset("assets/images/Container.png"),
          ),
          Positioned(
            bottom: 40,
            right: 100,
            width: 60,
            height: 60,
            child: Image.asset("assets/images/Container (1).png"),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: Container(
              padding: EdgeInsets.all(8),
              width: 135,
              height: 37,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Text(
                    "5 حوادث نشطة",
                    textAlign: TextAlign.right,
                    textDirection: TextDirection.rtl,
                    style: GoogleFonts.almarai(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF949494),
                    ),
                  ),
                  SizedBox(width: 4),
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
