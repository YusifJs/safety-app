import 'package:flutter/material.dart';
import 'package:safety_app/core/constants/app_assets.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/core/constants/app_text_style.dart';
import 'package:safety_app/core/utils/extensions/shadow_extension.dart';
import 'package:safety_app/features/home/peresntation/widgets/custom_circle_icon.dart';

class EmergencyCard extends StatelessWidget {
  final String country;
  const EmergencyCard({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: AppShadow.primaryShadow,
      ),
      child: Column(
        spacing: 10,
        children: [
          Row(
            spacing: 6,
            children: [
              Image.asset(AppAssets.flag),
              Text(country, style: AppTextStyle.blackBold16),
            ],
          ),
          Divider(color: AppColors.lightGrey),
          Row(
            spacing: 16,
            children: [
              Text('الشرطة', style: AppTextStyle.darkGreyRegular12),
              Spacer(),
              Text('122', style: AppTextStyle.blackBold16),
              CustomCircleIcon(
                color: AppColors.lightBlue,
                icon: Image.asset(AppAssets.phoneIcon, color: AppColors.blue),
              ),
            ],
          ),

          Row(
            spacing: 16,
            children: [
              Text('الإسعاف', style: AppTextStyle.darkGreyRegular12),
              Spacer(),
              Text('123', style: AppTextStyle.blackBold16),
              CustomCircleIcon(
                color: AppColors.lightRed,
                icon: Image.asset(AppAssets.phoneIcon, color: AppColors.red),
              ),
            ],
          ),
          Row(
            spacing: 16,
            children: [
              Text('الدفاع المدني', style: AppTextStyle.darkGreyRegular12),
              Spacer(),
              Text('180', style: AppTextStyle.blackBold16),
              CustomCircleIcon(
                color: AppColors.lightYellow,
                icon: Image.asset(
                  AppAssets.phoneIcon,
                  color: AppColors.darkYellow,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
