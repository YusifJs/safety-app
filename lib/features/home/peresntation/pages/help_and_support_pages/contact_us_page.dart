import 'package:safety_app/core/utils/imports.dart';
import 'package:safety_app/features/home/peresntation/widgets/custom_circle_icon.dart';
import 'package:safety_app/features/home/peresntation/widgets/custom_expansion_tile.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تواصل معنا'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            Text(
              'نحن هنا لمساعدتك على مدار الساعة في أي استفسار أو مشكلة تواجهك.',
              style: AppTextStyle.blackRegular16,
            ),
            SizedBox(height: 26.sp),
            CustomExpansionTile(
              leading: CustomCircleIcon(
                color: AppColors.lightBlue,
                icon: Image.asset(AppAssets.contactUs, color: AppColors.blue),
              ),
              title: 'راسلنا عبر البريد',
              content: [],
            ),
            CustomExpansionTile(
              leading: CustomCircleIcon(
                color: AppColors.lightBlue,
                icon: Image.asset(AppAssets.phoneIcon, color: AppColors.blue),
              ),
              title: 'تواصل معنا عبر الهاتف',
              content: [],
            ),
            CustomExpansionTile(
              leading: CustomCircleIcon(
                color: AppColors.lightBlue,
                icon: Image.asset(AppAssets.chatIcon, color: AppColors.blue),
              ),
              title: 'محادثة مباشرة مع الدعم الفني',
              content: [],
            ),
            Spacer(),
            Text(
              'تابعنا على منصات التواصل الاجتماعي',
              style: AppTextStyle.blueBold16,
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 24,
              children: [
                CustomCircleIcon(
                  color: AppColors.white,
                  icon: Image.asset(AppAssets.facebook),
                ),
                CustomCircleIcon(
                  color: AppColors.white,
                  icon: Image.asset(AppAssets.twitter),
                ),
                CustomCircleIcon(
                  color: AppColors.white,
                  icon: Image.asset(AppAssets.instagram),
                ),
              ],
            ),
            SizedBox(height: 80.sp),
          ],
        ),
      ),
    );
  }
}
