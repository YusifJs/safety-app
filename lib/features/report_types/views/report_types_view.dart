import 'package:flutter/material.dart';
import 'package:safety_app/features/report_types/views/widgets/report_types_view_body.dart';

class ReportTypesView extends StatelessWidget {
  const ReportTypesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: ReportTypesViewBody());
  }
}
