import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safety_app/core/di/dep_injection.dart';
import 'package:safety_app/core/helpers/cache_helper.dart';
import 'package:safety_app/core/routing/app_router.dart';
import 'package:safety_app/core/routing/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await setupGetIt();
  runApp(SafetyApp());
}

class SafetyApp extends StatelessWidget {
  const SafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Safety App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),

          initialRoute: Routes.PaymentScreen,
          onGenerateRoute: AppRouter().generateRoute,

          // home: const ReportPagesController(),
        );
      },
    );
  }
}
