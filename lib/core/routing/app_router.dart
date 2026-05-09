import 'package:flutter/material.dart';
import 'package:safety_app/core/routing/routes.dart';
import 'package:safety_app/features/home/peresntation/widgets/bottom_nav.dart';
import 'package:safety_app/features/login/login_screen.dart';
import 'package:safety_app/features/onboarding/onboarding_screen.dart';
import 'package:safety_app/features/possessions/presentation/pages/add_property_screen.dart';
import 'package:safety_app/features/possessions/presentation/pages/possessions_screen.dart';
import 'package:safety_app/features/rating/presentation/pages/rating_screen.dart';
import 'package:safety_app/features/report/presentation/pages/report_pages_controller.dart';
import 'package:safety_app/features/security_settings/peresentation/pages/security_seeting_screen.dart';
import 'package:safety_app/features/security_settings/peresentation/pages/secutity_sett_emty_state.dart';
import 'package:safety_app/features/Report_details/views/report_details_view.dart';
import 'package:safety_app/features/Reports_register/views/widgets/report_page_view.dart';
import 'package:safety_app/features/alerts/views/alerts_view.dart';
import 'package:safety_app/features/auth/presentation/pages/login_screen.dart';
import 'package:safety_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:safety_app/features/follow-me/presentation/screens/follow_me_screen.dart';
import 'package:safety_app/features/home/peresntation/pages/home_page.dart';
import 'package:safety_app/features/notification_settings/views/notification_settings_view.dart';
import 'package:safety_app/features/onboarding/onboarding_screen.dart';
import 'package:safety_app/features/payment-plan/presentation/payment_methods_screen.dart';
import 'package:safety_app/features/profile(1)/views/profile_1_view.dart';
import 'package:safety_app/features/profile(2)/views/profile(2)_page_view.dart';
import 'package:safety_app/features/rating/presentation/pages/rating_screen.dart';
import 'package:safety_app/features/report/presentation/pages/report_pages_controller.dart';
import 'package:safety_app/features/report_types/views/report_types_view.dart';
import 'package:safety_app/features/splash/animated_splash_screen.dart';
import 'package:safety_app/features/support_chat/presentation/screens/support_chat_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.animatedSplashScreen:
        return MaterialPageRoute(builder: (_) => AnimatedSplashScreen());

      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        
        case Routes.bottomNav:
        return MaterialPageRoute(builder: (_) => const BottomNav());
        
        case Routes.possessionsScreen:
        return MaterialPageRoute(builder: (_) => const PossessionsScreen());
        
        case Routes.securitySettings:
        return MaterialPageRoute(builder: (_) => const SecuritySettingsScreen());
        
        case Routes.addPossession:
        return MaterialPageRoute(builder: (_) => const AddPropertyScreen());
        
        case Routes.securitySettingsEmpty:
        return MaterialPageRoute(builder: (_) => const SecutitySettEmtpyState());

      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomePage());

      case Routes.followMeScreen:
        return MaterialPageRoute(builder: (_) => RafiqnyMapScreen());

      case Routes.PaymentScreen:
        return MaterialPageRoute(builder: (_) => PaymentMethodsScreen());

      case Routes.supportChat:
        return MaterialPageRoute(builder: (_) => SupportChatScreen());

      case Routes.reportScreenController:
        return MaterialPageRoute(builder: (_) => ReportPagesController());

      case Routes.ratingScreen:
        return MaterialPageRoute(builder: (_) => RatingScreen());

      case Routes.reportRegisterScreen:
        return MaterialPageRoute(builder: (_) => ReportPageView());

      case Routes.reportTypeScreen:
        return MaterialPageRoute(builder: (_) => ReportTypesView());

      case Routes.reportDetailsScreen:
        return MaterialPageRoute(builder: (_) => ReportDetailsView());

      case Routes.profileFirstScreen:
        return MaterialPageRoute(builder: (_) => Profile1View());

      case Routes.profileSecondScreen:
        return MaterialPageRoute(builder: (_) => ProfileSecondPageView());

      case Routes.notificationSettingsScreen:
        return MaterialPageRoute(builder: (_) => NotificationSettingsView());

      case Routes.alertsScreen:
        return MaterialPageRoute(builder: (_) => AlertsView());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
