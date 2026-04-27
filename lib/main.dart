import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_app/core/constants/app_colors.dart';
import 'package:safety_app/core/utils/helpers/cache_helper.dart';
import 'package:safety_app/features/home/peresntation/pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(SafetyApp());
}

class SafetyApp extends StatelessWidget {
  const SafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(393, 852),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.mainBgColor,
          appBarTheme: AppBarTheme(backgroundColor: AppColors.mainBgColor),
        ),
        //to make the app RTL
        builder: (context, child) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: child!,
          );
        },
        title: 'Safety App',
        home: const HomeScreen(),
      ),

    );
  }
}
