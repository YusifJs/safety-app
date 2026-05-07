import 'package:flutter/material.dart';
import 'package:safety_app/core/utils/imports.dart';
import 'package:safety_app/features/widgets/custom_elevated_button.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String? description;
  final String button1;
  final String button2;
  final Widget? dialogImage;

  const CustomDialog({
    super.key,
    required this.title,
    this.description,
    required this.button1,
    required this.button2,
    this.dialogImage,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final verticalSpace = size.height * 0.28;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.4),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: verticalSpace,
          ),
          child: Center(
            child: Container(
              width: 271,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  if (dialogImage != null) ...[
                    dialogImage!,
                    const SizedBox(height: 20),
                  ],

                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.blackBold20,
                  ),

                  if (description != null &&
                      description!.trim().isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(
                      description!,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.blackRegular12,
                    ),
                  ],

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      text: button1,
                      backgroundColor: AppColors.blue,
                      onClick: () => Navigator.pop(context),
                    ),
                  ),

                  const SizedBox(height: 8),

                  SizedBox(
                    width: double.infinity,
                    child: CustomElevatedButton(
                      text: button2,
                      backgroundColor: AppColors.white,
                      textStyle: AppTextStyle.blueBold16,
                      onClick: () => Navigator.pop(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
