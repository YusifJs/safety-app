import 'package:flutter/material.dart';
import 'package:safety_app/core/helpers/cache_helper.dart';
import 'package:safety_app/core/routing/app_router.dart';
import 'package:safety_app/core/routing/routes.dart';
import 'package:safety_app/features/splash/animated_splash_screen.dart';
import 'package:safety_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:safety_app/features/home/peresntation/pages/home_screen.dart';
import 'package:safety_app/features/report/presentation/pages/report_pages_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(SafetyApp());

}

class SafetyApp extends StatelessWidget {
  const SafetyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safety App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      home: const HomeScreen(),

      // home: const ReportPagesController(),
    );
  }
}
