import 'package:flutter/material.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/features/widgets/notification_button.dart';

class ReportAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarTitle;

  const ReportAppBar({super.key, required this.appBarTitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainBgColor,
      elevation: 0,
      automaticallyImplyLeading: false,

      title: Row(
        children: [
          const Icon(Icons.arrow_back, color: Colors.black),

          const SizedBox(width: 6),

          const Image(
            image: AssetImage('assets/bird.png'),
            width: 30,
            height: 30,
          ),

          const SizedBox(width: 6),

          Flexible(
            child: Text(
              appBarTitle,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),

      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 12),
          child: NotificationButton(),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
