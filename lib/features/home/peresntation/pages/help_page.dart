import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/core/constants/app_text_style.dart';
import 'package:safety_app/features/home/data/help_cards_data.dart';
import 'package:safety_app/features/home/peresntation/widgets/custom_help_card.dart';
import 'package:safety_app/features/widgets/notification_button.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('المساعدة', style: AppTextStyle.blackBold16),
        actions: [NotificationButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 94.sp,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.blue,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('كيف يمكننا مساعدتك؟', style: AppTextStyle.whiteBold20),
                  Text(
                    'اختر من القائمة أدناه للوصول السريع لما تحتاجه.',
                    style: AppTextStyle.whiteRegular12,
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.sp),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 16),
                itemCount: helpCardsdata.length,
                itemBuilder: (context, index) {
                  var card = helpCardsdata[index];
                  return InkWell(
                    onTap: () {},
                    child: CustomHelpCard(
                      title: card.title,
                      description: card.description,
                      color: card.color,
                      icon: card.icon,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
