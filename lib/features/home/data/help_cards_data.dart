import 'package:safety_app/core/constants/app_assets.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/features/home/data/help_card_model.dart';
import 'package:safety_app/features/home/peresntation/pages/help_and_support_pages/common_ques_page.dart';
import 'package:safety_app/features/home/peresntation/pages/help_and_support_pages/contact_us_page.dart';
import 'package:safety_app/features/home/peresntation/pages/help_and_support_pages/emergency_numbers_page.dart';
import 'package:safety_app/features/home/peresntation/pages/help_and_support_pages/safty_tools_page.dart';

final List<HelpCardModel> helpCardsdata = [
  HelpCardModel(
    icon: AppAssets.emergencyNumbers,
    title: "أرقام الطوارئ",
    description: "أرقام الطوارئ في الدول العربية",
    color: AppColors.lightRed,
    page: EmergencyNumbersPage(),
  ),
  HelpCardModel(
    icon: AppAssets.safetyTool,
    title: "أدلة السلامة",
    description: "خطوات وإرشادات للحالات الطارئة",
    color: AppColors.lightBlue,
    page: SaftyToolsPage(),
  ),
  HelpCardModel(
    icon: AppAssets.commonQestions,
    title: "الأسئلة الشائعة",
    description: "إجابات على أسئلتك المتكررة",
    color: AppColors.lightYellow,
    page: CommonQuesPage(),
  ),
  HelpCardModel(
    icon: AppAssets.contactUs,
    title: "تواصل معنا",
    description: "فريق الدعم متاح على مدار الساعة لمساعدتك",
    color: AppColors.lightGreen,
    page: ContactUsPage(),
  ),
  HelpCardModel(
    icon: AppAssets.rateApp,
    title: "تقييم التطبيق",
    description: "رأيك يهمنا لتحسين خدماتنا",
    color: AppColors.lightPurple,
    page: ContactUsPage(),
  ),
];
