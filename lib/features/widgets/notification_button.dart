import 'package:flutter/material.dart';
import 'package:safety_app/core/constants/app_colors.dart';

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
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.10),
              offset: Offset(0, 1),
              blurRadius: 3,
            ),
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.10),
              offset: Offset(0, 1),
              blurRadius: 2,
            ),
          ],
        ),
        child: Icon(Icons.notifications_none),
      ),
    );
  }
}
