import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchContainer extends StatelessWidget {
  const SearchContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: 339,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: BoxBorder.all(color: Colors.white),
        ),
        child: TextFormField(
          textAlign: TextAlign.right,
          textDirection: TextDirection.rtl,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            hintText: "ابحث عن موقع أو حادث...",
            hintTextDirection: TextDirection.rtl,
            hintStyle: GoogleFonts.almarai(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Color(0xFF949494),
            ),
            suffixIcon: Icon(Icons.search, size: 20, color: Color(0xFF949494)),
            border: InputBorder.none,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
          ),
        ),
      ),
    );
  }
}
