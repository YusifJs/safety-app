import 'package:flutter/material.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/core/constants/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Function()? onClick;
  const CustomElevatedButton({
    super.key,
    required this.text,
    this.textStyle,
    this.backgroundColor = AppColors.blue,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColors.blue,
        padding: EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.blue),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onPressed: onClick,
      child: Text(text, style: textStyle ?? AppTextStyle.whiteBold16),
    );
  }
}
