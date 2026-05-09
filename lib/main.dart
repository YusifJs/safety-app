import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:safety_app/core/di/dep_injection.dart';
import 'package:safety_app/core/routing/app_router.dart';
import 'package:safety_app/core/routing/routes.dart';

import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/core/utils/helpers/cache_helper.dart';
import 'package:safety_app/features/home/peresntation/widgets/bottom_nav.dart';
import 'package:safety_app/features/security_settings/peresentation/pages/security_seeting_screen.dart';
import 'package:safety_app/features/security_settings/peresentation/pages/secutity_sett_emty_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await setupGetIt();
  runApp(const SafetyApp());
}

class SafetyApp extends StatelessWidget {
  const SafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Safety App',

          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.mainBgColor,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.mainBgColor,
            ),
          ),

          builder: (context, child) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: child!,
            );
          },

          initialRoute: Routes.homeScreen,
          onGenerateRoute: AppRouter().generateRoute,
        );
      },
    );
  }
}
