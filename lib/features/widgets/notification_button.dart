import 'package:flutter/material.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/core/utils/extensions/shadow_extension.dart';

class NotificationButton extends StatelessWidget {
  const NotificationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: 24),
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
          boxShadow: AppShadow.primaryShadow,
        ),
        child: Icon(Icons.notifications_none),
      ),
    );
  }
}
