import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportContainer extends StatelessWidget {
  const ReportContainer({
    super.key,
    required this.reportText,
    required this.processText,
    required this.processColor,
    required this.processTextColor,
    required this.timeText,
  });
  final String reportText;
  final String processText;
  final String timeText;
  final Color processColor;
  final Color processTextColor;
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
                children: [
                  Container(
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
                  ),
                  SizedBox(width: 20),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(148, 148, 148, 0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      "#4092",
                      style: GoogleFonts.almarai(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF949494),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
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
                        "اليوم، 10:30 صباحاً",
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
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "التفاصيل",
                      style: GoogleFonts.almarai(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Color(0xFF174C8A),
                      ),
                    ),
                  ),
                  Text(
                    "شارع الاردن, عمان",
                    style: GoogleFonts.almarai(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Color(0xFF949494),
                    ),
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
