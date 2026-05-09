import 'package:safety_app/core/utils/imports.dart';
import 'package:safety_app/features/possessions/presentation/widgets/header.dart';
import 'package:safety_app/features/security_settings/peresentation/widgets/custom_button_sett.dart';
import 'package:safety_app/features/security_settings/peresentation/widgets/emrg_contact_card.dart';
class SecuritySettingsScreen extends StatelessWidget {
  const SecuritySettingsScreen({super.key});

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Header(text: 'إعدادات الحماية'),

                const SizedBox(height: 20),

                /// ================= Contacts Section =================
                const Text(
                  "جهات الاتصال الطارئة",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 4),
                const Text(
                  "الأشخاص الذين سيتم التواصل معهم في الحالات الطارئة",
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const SizedBox(height: 15),

                const EmergencyContactCard(
                  name: "أحمد محمد",
                  phone: "+966 50 123 4567",
                ),
                const EmergencyContactCard(
                  name: "فاطمة علي",
                  phone: "+966 55 234 5678",
                ),
                const EmergencyContactCard(
                  name: "خالد السعيد",
                  phone: "+966 54 345 6789",
                ),

                const SizedBox(height: 10),

                // زر إضافة جهة اتصال
                CustomButtonSett(
                  label: ' إضافة جهة اتصال',
                  icon: Icons.add,
                  onPressed: () {},
                ),

                const SizedBox(height: 25),

                /// ================= Voice Password Section =================
                const Text(
                  "كلمة السر الصوتية",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 4),
                const Text(
                  "استخدمها لإرسال تنبيه صوتي سريع عند الخطر",
                  style: TextStyle(color: AppColors.darkGrey, fontSize: 15),
                ),
                const SizedBox(height: 12),

                // كارت كلمة السر الصوتية المظبوط
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: const Color(0xffE8F0F9),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.lock_outline,
                              color: Color(0xff174C8A),
                              size: 20,
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "الكلمة الحالية",
                                style: TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                              Text(
                                "*********",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.visibility_outlined,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                /// ================= Action Buttons =================
                CustomButtonSett(
                  label: "تغيير الكلمة الحالية",
                  icon: Icons.mic_none_outlined,
                  onPressed: () {},
                ),
                
                const SizedBox(height: 10),

                // زر الحذف
                Center(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: AppColors.blue),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "حذف",
                        style: TextStyle(
                          color: AppColors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}