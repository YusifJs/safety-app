import 'package:flutter/material.dart';
import 'package:safety_app/core/constants/app_colors.dart';

class QuickActionChip extends StatelessWidget {
  final String text;
  final IconData icon;
  final Color? textColor;
  final VoidCallback onTap;

  const QuickActionChip({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(24),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: textColor ?? AppColors.blue),
              const SizedBox(width: 6),
              Text(
                text,
                style: TextStyle(
                  color: textColor ?? AppColors.black,
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
