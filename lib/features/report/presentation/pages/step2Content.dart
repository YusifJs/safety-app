import 'package:flutter/material.dart';
import '../widgets/map_section.dart';
import '../widgets/date_time_section.dart';

class Step2content extends StatelessWidget {
  const Step2content({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        MapSection(),
        SizedBox(height: 16),
        DateTimeSection(),
      ],
    );
  }
}
