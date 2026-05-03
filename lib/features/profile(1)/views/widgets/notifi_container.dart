import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifiContainer extends StatelessWidget {
  const NotifiContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 355,
        height: 57,
        decoration: BoxDecoration(
          color: Color(0xFFFEFCE8),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
            ),
            Text(
              "اكمل اعدادات الحماية واضف المواقع.. ",
              textAlign: TextAlign.right,
              textDirection: TextDirection.rtl,
              style: GoogleFonts.almarai(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 5),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: Color(0xFFED9807),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: ImageIcon(
                  AssetImage("assets/images/Icon (9).png"),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
