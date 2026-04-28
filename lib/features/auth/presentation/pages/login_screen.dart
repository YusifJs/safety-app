import 'package:flutter/material.dart';
import 'package:safety_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:safety_app/features/auth/presentation/widgets/build_header.dart';
import '../widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // الزخرفة اللي فوق
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight * 0.30,
              child: Image.asset(
                'assets/images/Group (1).png',
                fit: BoxFit.fill,
              ),
            ),
          ),

          // الزخرفة اللي تحت
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: screenHeight * 0.30,
              child: Image.asset(
                'assets/images/Group (3).png',
                fit: BoxFit.fill,
              ),
            ),
          ),

          // المحتوى الأساسي
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 70),
              child: Column(
                children: [
                  const SizedBox(height: 40),

                  // اللوجو
                  const BuildHeader(text: "تسجيل دخول"),

                  const SizedBox(height: 50),

                  // الرقم الوطني
                  const CustomTextField(
                    label: "الرقم الوطني",
                    hint: "ادخل رقمك الوطني",
                  ),

                  const SizedBox(height: 20),

                  // كلمة السر
                  const CustomTextField(
                    label: "كلمة السر",
                    hint: "ادخل كلمة السر",
                    isPassword: true,
                  ),

                  // نسيت كلمة السر
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        "هل نسيت كلمة السر؟",
                        style: TextStyle(
                          color: Color(0xff174C8A),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // زر تسجيل الدخول
                  AuthButton(text: 'تسجيل دخول'),

                  const SizedBox(height: 20),

                  // إنشاء حساب
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "لا تملك حساب ؟ ",
                          style: TextStyle(color:  Color(0xff174C8A), fontSize: 14),
                        ),
                        TextSpan(
                          text: "إنشاء حساب",
                          style: const TextStyle(
                            color: Color(0xff174C8A),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


