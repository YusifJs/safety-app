import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportDeatilsContainer extends StatelessWidget {
  const ReportDeatilsContainer({super.key, required this.reportText});

  final String reportText;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.only(top: 10, left: 8, right: 8),
        width: screenWidth * 0.9,
        height: screenHeight * 0.21,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 0.1),
        ),
        child: Expanded(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        reportText,
                        style: GoogleFonts.almarai(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "اعتداءات و مضايقات",
                        style: GoogleFonts.almarai(
                          fontSize: 17,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF949494),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 41,
                      height: 41,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(148, 148, 148, 0.3),
                      ),
                      child: ImageIcon(
                        AssetImage("assets/images/Icon.png"),
                        color: Color(0xFF949494),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 22),
              Divider(
                color: Color(0xFF949494),
                thickness: 1,
                indent: 16,
                endIndent: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "المسؤول",
                        style: GoogleFonts.almarai(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF949494),
                        ),
                      ),
                      Text(
                        "لم يتم تعيينه",
                        style: GoogleFonts.almarai(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ImageIcon(
                    AssetImage("assets/images/Icon (3).png"),
                    color: Color(0xFF174C8A),
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      Text(
                        "الوقت",
                        style: GoogleFonts.almarai(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF949494),
                        ),
                      ),
                      Text(
                        "10:30 AM",
                        style: GoogleFonts.almarai(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ImageIcon(
                    AssetImage("assets/images/Icon (4).png"),
                    color: Color(0xFF174C8A),
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      Text(
                        "التاريخ",
                        style: GoogleFonts.almarai(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Color(0xFF949494),
                        ),
                      ),
                      Text(
                        "اليوم",
                        style: GoogleFonts.almarai(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  ImageIcon(
                    AssetImage("assets/images/Icon (3).png"),
                    color: Color(0xFF174C8A),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
