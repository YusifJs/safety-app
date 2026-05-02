import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircleIcon extends StatelessWidget {
  final Color color;
  final Widget icon;
  const CustomCircleIcon({super.key, required this.color, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.sp,
      width: 48.sp,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),

      child: icon,
    );
  }
}
