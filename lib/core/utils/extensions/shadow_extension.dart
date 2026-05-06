import 'package:flutter/material.dart';
import 'package:safety_app/core/constants/app_colors.dart';

extension AppShadow on BoxShadow {
  static List<BoxShadow> primaryShadow = [
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
  ];
}
