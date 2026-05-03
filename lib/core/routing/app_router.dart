import 'package:flutter/material.dart';
import 'package:safety_app/core/routing/routes.dart';
import 'package:safety_app/features/login/login_screen.dart';
import 'package:safety_app/features/onboarding/onboarding_screen.dart';
import 'package:safety_app/features/rating/presentation/pages/rating_screen.dart';
import 'package:safety_app/features/report/presentation/pages/report_pages_controller.dart';
import 'package:safety_app/features/splash/animated_splash_screen.dart';
import 'package:safety_app/features/support_chat/presentation/screens/support_chat_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.AnimatedSplashScreen:
        return MaterialPageRoute(builder: (_) => AnimatedSplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.supportChat:
        return MaterialPageRoute(builder: (_) => SupportChatScreen());
      case Routes.reportScreenController:
        return MaterialPageRoute(builder: (_) => ReportPagesController());
      case Routes.ratingScreen:
        return MaterialPageRoute(builder: (_) => RatingScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
