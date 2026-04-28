import 'package:flutter/material.dart';
import 'package:safety_app/features/report/presentation/widgets/report_type_box.dart';

class Step1Content extends StatelessWidget {
  const Step1Content({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 5,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.1,
      ),
      itemBuilder: (context, index) {
        return ReportTypeBox(title: "Item $index", icon: Icons.star);
      },
    );
  }
}
