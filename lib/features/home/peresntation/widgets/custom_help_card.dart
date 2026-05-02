import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/core/constants/app_text_style.dart';
import 'package:safety_app/core/utils/extensions/shadow_extension.dart';
import 'package:safety_app/features/home/peresntation/widgets/custom_circle_icon.dart';

class CustomHelpCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final Widget icon;
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
      height: 82.sp,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: AppShadow.primaryShadow,
      ),
      child: Row(
        spacing: 10,
        children: [
          CustomCircleIcon(color: color, icon: icon),
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
