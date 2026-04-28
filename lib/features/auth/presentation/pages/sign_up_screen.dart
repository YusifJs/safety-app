import 'package:flutter/material.dart';
import 'package:safety_app/features/auth/presentation/widgets/auth_button.dart';
import 'package:safety_app/features/auth/presentation/widgets/build_header.dart';
import 'package:safety_app/features/auth/presentation/widgets/custom_text_field.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool isDeaf = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          _buildTopDecoration(screenHeight),
          _buildBottomDecoration(screenHeight),
          _buildContent(),
        ],
      ),
    );
  }

  //================ Decorations ================

  Widget _buildTopDecoration(double screenHeight) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: screenHeight * 0.22,
        child: Image.asset(
          'assets/images/Group (1).png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildBottomDecoration(double screenHeight) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SizedBox(
        height: screenHeight * 0.22,
        child: Image.asset(
          'assets/images/Group (3).png',
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  //================ Main Content ================

  Widget _buildContent() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
           const BuildHeader(text: "إنشاء حساب جديد"),
            const SizedBox(height: 30),

            const CustomTextField(
              label: "الاسم الثلاثي",
              hint: "ادخل اسمك الثلاثي",
            ),
            const SizedBox(height: 15),

            const CustomTextField(
              label: "الرقم الوطني",
              hint: "ادخل الرقم الوطني",
            ),
            const SizedBox(height: 15),

            const CustomTextField(
              label: "كلمة المرور",
              hint: "ادخل كلمة المرور الخاصة بك",
              isPassword: true,
            ),
            const SizedBox(height: 15),

            _buildPhoneField(),
            const SizedBox(height: 15),

            _buildDropdownSection("فصيلة الدم"),
            const SizedBox(height: 15),

            _buildDropdownSection("نوع الحساب"),
            const SizedBox(height: 20),

            _buildSwitchRow(),
            const SizedBox(height: 25),

            const AuthButton(text: 'إنشاء حساب',),
            const SizedBox(height: 20),

            RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "لديك حساب بالفعل؟ ",
                          style: TextStyle(color:  Color(0xff174C8A), fontSize: 20),
                        ),
                        TextSpan(
                          text: "تسجيل دخول",
                          style: const TextStyle(
                            color: Color(0xff174C8A),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //================ Header ================

  

  //================ Phone Field ================

  Widget _buildPhoneField() {
    return Column(
      children: [
        _buildLabel("رقم الهاتف"),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xffF1F4F7),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xff174C8A)),
              ),
              child: const Text(
                "JOD ▼",
                style: TextStyle(color: Color(0xff174C8A)),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _buildInputContainer("ادخل رقم هاتفك"),
            ),
          ],
        ),
      ],
    );
  }

  //================ Dropdown Section ================

  Widget _buildDropdownSection(String label) {
    return Column(
      children: [
        _buildLabel(label),
        _buildInputContainer("...اختر"),
      ],
    );
  }

  //================ Reusable Input Container ================

  Widget _buildInputContainer(String hint) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xffF1F4F7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xff174C8A).withOpacity(0.4),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.keyboard_arrow_down,
            color: Color(0xff174C8A),
          ),
          Text(
            hint,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  //================ Switch ================

  Widget _buildSwitchRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Switch(
          value: isDeaf,
        
          activeThumbColor: const Color(0xff174C8A),
          onChanged: (value) {
            setState(() {
              isDeaf = value;
            });
          },
        ),
        const Text(
          "هل تعاني من الصمم ؟",
          style: TextStyle(
            color: Color(0xff174C8A),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  //================ Bottom Text ================

  

  //================ Label ================

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: const TextStyle(
            color: Color(0xff174C8A),
            fontSize:20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}