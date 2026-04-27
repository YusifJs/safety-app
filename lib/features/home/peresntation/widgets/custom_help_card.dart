import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/core/constants/app_text_style.dart';

class CustomHelpCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final String icon;
  const CustomHelpCard({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      // margin: EdgeInsets.only(bottom: 16),
      height: 82.sp,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            offset: Offset(0, 4),
            blurRadius: 6,
          ),
        ],
      ),
      child: Row(
        spacing: 10,
        children: [
          Container(
            height: 48.sp,
            width: 48.sp,
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),

            child: Image.asset(icon),
          ),
          Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyle.blackRegular16),
              Text(description, style: AppTextStyle.blackRegular12),
            ],
          ),
          Spacer(),
          Icon(Icons.arrow_forward_ios, size: 18),
        ],
      ),
    );
  }
}
