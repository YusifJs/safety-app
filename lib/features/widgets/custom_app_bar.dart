import 'package:flutter/material.dart';
import 'package:safety_app/core/constants/app_assets.dart';
import 'package:safety_app/core/constants/app_text_style.dart';
import 'package:safety_app/features/widgets/notification_button.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({super.key, required String title})
    : super(
        titleSpacing: 0,
        title: Row(
          spacing: 4,
          children: [
            Image.asset(AppAssets.bird, scale: 4),
            Text(title, style: AppTextStyle.blackBold16),
          ],
        ),
        actions: [NotificationButton()],
      );
}
