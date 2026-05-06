import 'package:flutter/material.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/features/possessions/presentation/pages/add_property_screen.dart';
import 'package:safety_app/features/possessions/presentation/pages/premium_alert.dart';

class AddPropertyButton extends StatelessWidget {
  const AddPropertyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // يخليه full width بشكل صحيح
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddPropertyScreen(),
            ),);
        },
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "إضافة ممتلك جديد",
          style: TextStyle(
            color: AppColors.white,
            fontSize: 16, 
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor:AppColors.blue,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
