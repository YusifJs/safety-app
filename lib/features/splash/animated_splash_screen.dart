import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:animate_do/animate_do.dart';

class AnimatedSplashScreen extends StatefulWidget {
  const AnimatedSplashScreen({super.key});
  static const String routeName = '/SplashScreen';
  @override
  State<AnimatedSplashScreen> createState() => _AnimatedSplashScreenState();
}

class _AnimatedSplashScreenState extends State<AnimatedSplashScreen> {
  @override
  void SetState() {
    super.initState();
    _startAnimationSequence();
  }

  _startAnimationSequence() async {
    await Future.delayed(const Duration(seconds: 1));
    FlutterNativeSplash.remove();
    await Future.delayed(const Duration(seconds: 4));
  }

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
