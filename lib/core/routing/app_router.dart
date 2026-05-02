import 'package:flutter/material.dart';
import 'package:safety_app/core/routing/routes.dart';
import 'package:safety_app/features/auth/presentation/pages/login_screen.dart';
import 'package:safety_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:safety_app/features/follow-me/presentation/screens/follow_me_screen.dart';
import 'package:safety_app/features/home/peresntation/pages/home_screen.dart';
import 'package:safety_app/features/onboarding/onboarding_screen.dart';
import 'package:safety_app/features/payment-plan/presentation/payment_methods_screen.dart';
import 'package:safety_app/features/splash/animated_splash_screen.dart';

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
      case Routes.SignUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.followMeScreen:
        return MaterialPageRoute(builder: (_) => RafiqnyMapScreen());
      case Routes.PaymentScreen:
        return MaterialPageRoute(builder: (_) => PaymentMethodsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
