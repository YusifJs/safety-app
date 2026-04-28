import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDialogImage extends StatelessWidget {
  final String iconPath;
  final Color iconColor;
  final Color bgColor;
  const CustomDialogImage({
    super.key,
    required this.iconPath,
    required this.iconColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.sp,
      width: 80.sp,
      decoration: BoxDecoration(shape: BoxShape.circle, color: bgColor),
      child: Image.asset(iconPath, color: iconColor),
    );
  }
}
