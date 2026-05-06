import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotiCustomAppBar extends StatelessWidget {
  const NotiCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: ImageIcon(AssetImage("assets/images/Icon (1).png")),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
          Text(
            "اعدادات الاشعارات",
            style: GoogleFonts.almarai(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Image.asset("assets/images/1775826274282 1.png"),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              AssetImage("assets/images/Vector (2).png"),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }
}
