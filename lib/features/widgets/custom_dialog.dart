import 'package:safety_app/core/utils/imports.dart';
import 'package:safety_app/features/widgets/custom_elevated_button.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String description;
  final String button1;
  final String button2;
  final Widget dialogImage;
  const CustomDialog({
    super.key,
    required this.title,
    required this.description,
    required this.button1,
    required this.button2,
    required this.dialogImage,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.only(left: 12, right: 12, bottom: 52, top: 30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: AppColors.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            dialogImage,
            SizedBox(height: 24.sp),
            Text(
              title,
              style: AppTextStyle.blackBold20,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.sp),
            Text(
              description,
              style: AppTextStyle.blackRegular12,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.sp),
            CustomElevatedButton(text: button1),
            SizedBox(height: 8.sp),
            CustomElevatedButton(
              text: button2,
              backgroundColor: AppColors.transperant,
              textStyle: AppTextStyle.blueBold16,
            ),
          ],
        ),
      ),
    );
  }
}
