import 'package:flutter/material.dart';
import 'package:safety_app/features/possessions/presentation/widgets/header.dart';
import 'package:safety_app/features/security_settings/peresentation/widgets/add_contact_dialog.dart';
import 'package:safety_app/features/security_settings/peresentation/widgets/custom_button_sett.dart';
import 'package:safety_app/features/security_settings/peresentation/widgets/voic_rec_dialog.dart';

class SecutitySettEmtpyState extends StatelessWidget {
  const SecutitySettEmtpyState({super.key});

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: const Color(0xffF8FAFF),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Header(text: 'اعدادات الحماية'),
                const SizedBox(height: 30),
     
                /// ================= Contacts Card =================
                _buildEmptyStateCard(
                  title: "جهات الاتصال الطارئة",
                  subtitle: "الأشخاص الذين سيتم التواصل معهم في الحالات الطارئة",
                  buttonLabel: "اضافة جهة اتصال",
                  icon: Icons.add,
                  onPressed: () {
                    showAddContactDialog(context);
                  },
                ),
     
                const SizedBox(height: 20),
     
                /// ================= Voice Password Card =================
                _buildEmptyStateCard(
                  title: "كلمة السر الصوتية",
                  subtitle: "استخدمها لإرسال تنبيه صوتي سريع عند الخطر",
                  buttonLabel: "اضافة",
                  icon: Icons.mic_none,
                  onPressed: () {
                    showVoiceRecordingDialog(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
   );
  }

  // ويدجت صغيرة عشان م نكرر كود الكروت ونحافظ على نظافة الكود
  Widget _buildEmptyStateCard({
    required String title,
    required String subtitle,
    required String buttonLabel,
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24), // حواف دائرية ناعمة زي الصورة
      ),
      child: Column(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.grey, fontSize: 13, height: 1.4),
          ),
          const SizedBox(height: 25),
          
          // الزرار هنا حجمه متحدد ومصغر
        CustomButtonSett(
            label: buttonLabel,
            icon: icon,
            onPressed: onPressed,
            backgroundColor: const Color(0xff174C8A), // لون ثابت أو من AppColors
          ),
        ],
      ),
    );
  }
}