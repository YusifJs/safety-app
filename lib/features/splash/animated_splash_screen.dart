import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:animate_do/animate_do.dart';
import 'package:safety_app/core/utils/helpers/cache_helper.dart';
import 'package:safety_app/core/routing/routes.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});
  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  void initState() {
    super.initState();
    _startAnimationSequence();
  }

  Future<void> _startAnimationSequence() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;
    bool? onBoardingDone =
        CacheHelper.getData(key: 'onboarding_completed') ?? false;
    if (onBoardingDone) {
      Navigator.pushReplacementNamed(context, Routes.loginScreen);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onBoardingScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/back_ground.png',
              fit: BoxFit.cover,
            ),
          ),

          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FadeInDown(
                  duration: const Duration(milliseconds: 1000),
                  child: ZoomIn(
                    duration: const Duration(milliseconds: 1200),
                    child: Image.asset(
                      'assets/icons/spash_logo.png',
                      width: 150,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                FadeInUp(
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 1000),
                  child: Image.asset('assets/icons/SplashText.png', width: 220),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
