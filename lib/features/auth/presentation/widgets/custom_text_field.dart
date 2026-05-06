import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.end, // عشان الكلام يبقى عربي جهة اليمين
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xff174C8A),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          textAlign: TextAlign.right,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 15, color: Color(0xff174C8A)),
            filled: true,
            fillColor: Colors.blueGrey.withOpacity(0.05),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xff174C8A)),
            ),
          ),
        ),
      ],
    );
  }
}
