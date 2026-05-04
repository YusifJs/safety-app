import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/report_cubit.dart';
import '../cubit/report_state.dart';
import '../widgets/report_type_box.dart';

class ReportType {
  final String title;
  final String icon;

  const ReportType({required this.title, required this.icon});
}

const List<ReportType> reportTypes = [
  ReportType(title: "تحرش", icon: "assets/icons/harassment.svg"),
  ReportType(title: "مروري", icon: "assets/icons/traffic.svg"),
  ReportType(title: "اعتداء", icon: "assets/icons/assault.svg"),
  ReportType(title: "سرقة", icon: "assets/icons/theft.svg"),
  ReportType(title: "مفقودات", icon: "assets/icons/lost.svg"),
];

class Step1Content extends StatelessWidget {
  const Step1Content({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        return GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: reportTypes.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            final item = reportTypes[index];

            final isSelected = state.selectedReportType == item.title;

            return GestureDetector(
              onTap: () {
                context.read<ReportCubit>().selectReportType(item.title);
              },
              child: ReportTypeBox(
                title: item.title,
                icon: item.icon,
                isSelected: isSelected,
              ),
            );
          },
        );
      },
    );
  }
}
