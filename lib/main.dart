import 'package:flutter/material.dart';
import 'package:safety_app/core/routing/app_router.dart';
import 'package:safety_app/core/routing/routes.dart';
import 'package:safety_app/features/splash/animated_splash_screen.dart';

import 'package:safety_app/features/auth/presentation/pages/sign_up_screen.dart';
import 'package:safety_app/features/home/peresntation/pages/home_screen.dart';

void main() {
  runApp(const SafetyApp());
}

class SafetyApp extends StatelessWidget {
  const SafetyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safety App',
      theme: ThemeData(
        
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomeScreen()
      ,
    );
  }
}

