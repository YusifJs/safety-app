import 'package:flutter/material.dart';
import 'package:safety_app/features/alerts/views/widgets/alerts_view_body.dart';

class AlertsView extends StatelessWidget {
  const AlertsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: AlertsViewBody());
  }
}
