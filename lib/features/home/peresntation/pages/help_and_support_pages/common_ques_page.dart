import 'package:safety_app/core/utils/imports.dart';
import 'package:safety_app/features/home/peresntation/widgets/custom_expansion_tile.dart';

class CommonQuesPage extends StatelessWidget {
  const CommonQuesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'الاسئلة الشائعة'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 26),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 16,
          children: [
            Text(
              'ابحث عن اجابات لاستفساراتك',
              style: AppTextStyle.blackRegular16,
            ),
            SizedBox(height: 26.sp),
            CustomExpansionTile(
              title: 'كيف يعمل زر نداء الاستغاثة(SOS)؟',
              content: [
                Text(
                  'هي ميزة ذكية تعتمد على تقنيات التتبع الجغرافي والذكاء الاصطناعي لضمان وصولك الآمن. بمجرد تحديد وجهتك، يقوم التطبيق برسم المسار الأمثل وتقدير الوقت اللازم للوصول (بناءً على خرائط Google). يقوم النظام بمراقبة رحلتك تلقائياً؛ وفي حال حدوث انحراف غير مبرر عن المسار أو تأخر في الوصول عن الوقت المحدد دون تأكيد سلامتك، يقوم التطبيق فوراً بفتح بلاغ طوارئ تلقائي وتزويد العمليات بموقعك الحالي لضمان التدخل السريع',
                  style: AppTextStyle.blackRegular12,
                ),
              ],
            ),
            CustomExpansionTile(title: 'ما هي ميزة رافقني؟', content: []),
            CustomExpansionTile(
              title: 'ماذا لو ارسلت بيانا بالخطأ؟',
              content: [],
            ),
            CustomExpansionTile(title: 'كيف يمكنني تحديث بياناتي', content: []),
          ],
        ),
      ),
    );
  }
}
