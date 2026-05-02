import 'package:safety_app/features/home/data/safty_tools_data.dart';
import 'package:safety_app/features/home/peresntation/widgets/custom_circle_icon.dart';
import 'package:safety_app/features/home/peresntation/widgets/custom_expansion_tile.dart';
import 'package:safety_app/core/utils/imports.dart';

class SaftyToolsPage extends StatelessWidget {
  const SaftyToolsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'أدلة السلامة'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            Text(
              'إرشادات هامة للتعامل مع الحالات الطارئة خطوة بخطوة للحفاظ على سلامتك.',
              style: AppTextStyle.blackRegular16,
            ),
            SizedBox(height: 30.sp),
            CustomExpansionTile(
              leading: CustomCircleIcon(
                color: AppColors.lightRed,
                icon: Image.asset(AppAssets.fireIcon),
              ),
              title: 'ماذا تفعل عند نشوب حريق؟',
              content: List.generate(SaftytoolsSteps.fire.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: _buildStep(index + 1, SaftytoolsSteps.fire[index]),
                );
              }),
            ),
            CustomExpansionTile(
              title: 'التصرف أثناء الزلازل',
              leading: CustomCircleIcon(
                color: AppColors.lightYellow,
                icon: Image.asset(AppAssets.warningsIcon),
              ),
              content: [],
            ),
          ],
        ),
      ),
    );
  }

  Row _buildStep(int number, String text) {
    return Row(
      spacing: 12,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: AppColors.blue,
          child: Text(
            '$number',
            style: AppTextStyle.whiteRegular12.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Text(text, style: AppTextStyle.darkGreyRegular12),
      ],
    );
  }
}
