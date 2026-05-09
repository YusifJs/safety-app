import 'package:flutter/material.dart';

class CustomButtonSett extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;

  const CustomButtonSett({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.backgroundColor, // اختياري لو حبيت تغير اللون في مكان معين
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.5,
        height: 40,
        child: ElevatedButton.icon(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 18,
            color: Colors.white,
          ),
          label: Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.white, // خليتها أبيض ثابتة أو غيرها لـ AppColors
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor ?? const Color(0xff174C8A),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 8),
          ),
        ),
      ),
    );
  }
}