import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/report_cubit.dart';
import '../cubit/report_state.dart';

class DateTimeSection extends StatelessWidget {
  const DateTimeSection({super.key});

  String formatDate(DateTime? date) {
    if (date == null) return "التاريخ";
    return "${date.day}/${date.month}/${date.year}";
  }

  String formatTime(BuildContext context, TimeOfDay? time) {
    if (time == null) return "الوقت";
    return time.format(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Switch(
                    value: state.isNow,
                    onChanged: context.read<ReportCubit>().toggleNow,
                  ),
                  const Spacer(),
                  const Text("هل الحادث يحدث الآن؟"),
                ],
              ),
              if (!state.isNow)
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () async {
                          final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(2020),
                            lastDate: DateTime.now(),
                            initialDate: DateTime.now(),
                          );
                          if (date != null) {
                            context.read<ReportCubit>().setDate(date);
                          }
                        },
                        child: Text(formatDate(state.date)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () async {
                          final time = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (time != null) {
                            context.read<ReportCubit>().setTime(time);
                          }
                        },
                        child: Text(formatTime(context, state.time)),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}
