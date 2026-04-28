import 'package:flutter/material.dart';

class ReportTypeBox extends StatelessWidget {
  final String title;
  final IconData icon;

  const ReportTypeBox({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 30),
          const SizedBox(height: 10),
          Text(title),
        ],
      ),
    );
  }
}
