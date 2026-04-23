import 'package:flutter/material.dart';

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "سَـلَام",
          style: TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.bold,
            color: Color(0xff174C8A),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff174C8A),
          ),
        ),
      ],
    );
  }
}