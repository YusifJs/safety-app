import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/report_cubit.dart';
import '../cubit/report_state.dart';
import '../widgets/report_type_box.dart';

class Step1Content extends StatelessWidget {
  const Step1Content({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> reportTypes = [
      {"title": "تحرش", "icon": Icons.warning_amber},
      {"title": "مروري", "icon": Icons.car_crash},
      {"title": "اعتداء", "icon": Icons.security},
      {"title": "سرقة", "icon": Icons.lock},
      {"title": "مفقودات", "icon": Icons.inventory},
    ];

    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        return GridView.builder(
          itemCount: reportTypes.length,

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.1,
          ),

          itemBuilder: (context, index) {
            final item = reportTypes[index];

            final isSelected = state.selectedReportType == item['title'];

            return GestureDetector(
              onTap: () {
                context.read<ReportCubit>().selectReportType(item['title']);
              },

              child: ReportTypeBox(
                title: item['title'],
                icon: item['icon'],
                isSelected: isSelected,
              ),
            );
          },
        );
      },
    );
  }
}
