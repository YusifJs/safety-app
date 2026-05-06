import 'package:flutter/material.dart';
import 'package:safety_app/features/notification_settings/views/widgets/noti_settings_view_body.dart';

class NotificationSettingsView extends StatelessWidget {
  const NotificationSettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NotiSettingsViewBody(),
    );
  }
}
