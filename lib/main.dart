import 'package:flutter/material.dart';
import 'package:safety_app/core/helpers/cache_helper.dart';
import 'package:safety_app/core/routing/app_router.dart';
import 'package:safety_app/core/routing/routes.dart';
import 'package:safety_app/features/splash/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(SafetyApp());
}

class SafetyApp extends StatelessWidget {
  const SafetyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.AnimatedSplashScreen,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
