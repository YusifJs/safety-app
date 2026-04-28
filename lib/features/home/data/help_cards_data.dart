import 'package:safety_app/core/constants/app_assets.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/features/home/data/help_card_model.dart';

final List<HelpCardModel> helpCardsdata = [
  HelpCardModel(
    icon: AppAssets.emergencyNumbers,
    title: "أرقام الطوارئ",
    description: "أرقام الطوارئ في الدول العربية",
    color: AppColors.lightRed,
  ),
  HelpCardModel(
    icon: AppAssets.safetyTool,
    title: "أدلة السلامة",
    description: "خطوات وإرشادات للحالات الطارئة",
    color: AppColors.lightBlue,
  ),
  HelpCardModel(
    icon: AppAssets.commonQestions,
    title: "الأسئلة الشائعة",
    description: "إجابات على أسئلتك المتكررة",
    color: AppColors.lightYellow,
  ),
  HelpCardModel(
    icon: AppAssets.contactUs,
    title: "تواصل معنا",
    description: "فريق الدعم متاح على مدار الساعة لمساعدتك",
    color: AppColors.lightGreen,
  ),
  HelpCardModel(
    icon: AppAssets.rateApp,
    title: "تقييم التطبيق",
    description: "رأيك يهمنا لتحسين خدماتنا",
    color: AppColors.lightPurple,
  ),
];
