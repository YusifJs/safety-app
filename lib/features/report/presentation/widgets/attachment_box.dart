import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class AttachmentBox extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const AttachmentBox({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: onTap,
      child: DottedBorder(
        options: RoundedRectDottedBorderOptions(radius: Radius.circular(10)),
        child: Container(
          height: 130,
          width: double.infinity,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.grey.shade700),

              const SizedBox(height: 12),

              Text(
                text,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
