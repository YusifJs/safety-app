import 'package:flutter/material.dart';
import 'package:safety_app/features/payment-plan/presentation/addcard_screen.dart';
import 'package:safety_app/features/payment-plan/presentation/widgets/buildCurrentPlanHeader.dart';
import 'package:safety_app/features/payment-plan/presentation/widgets/buildEmptyPaymentState.dart';
import 'package:safety_app/features/payment-plan/presentation/widgets/buildPaymentMethodTile.dart';
import 'package:safety_app/features/payment-plan/presentation/widgets/buildPlanCard.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreenState();
}

class _PaymentMethodsScreenState extends State<PaymentMethodsScreen> {
  String currentSubscribedPlan = 'مجاني';

  String activePlan = 'مجاني';

  int? selectedPaymentIndex;
  List<Map<String, String>> myCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'خطط الدفع والاشتراك',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        leading: const BackButton(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: CircleAvatar(
                radius: 35,
                backgroundColor: Color(0xFF1E4E8C),
                child: Icon(Icons.credit_card, size: 40, color: Colors.white),
              ),
            ),
            const SizedBox(height: 15),
            const Center(
              child: Text(
                'اختر خطة الدفع المناسبة لك',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 25),

            buildCurrentPlanHeader(currentSubscribedPlan),
            const SizedBox(height: 20),

            GestureDetector(
              onTap: () => setState(() => activePlan = 'مجاني'),
              child: buildPlanCard(
                title: 'مجاني',
                price: '0 \$ / دائماً',
                isActive: activePlan == 'مجاني',
                features: [
                  'بلاغات SOS ذكية (صوت، فيديو، شات)',
                  'تنبيهات منطقة جغرافية واحدة',
                  'تسجيل ممتلكات (جهاز واحد فقط)',
                  'دعم فني عبر التطبيق',
                ],
                icon: Icons.shield_outlined,

                statusTag: currentSubscribedPlan == 'مجاني' ? 'نشطة' : null,
              ),
            ),
            const SizedBox(height: 15),

            GestureDetector(
              onTap: () => setState(() => activePlan = 'مميز'),
              child: buildPlanCard(
                title: 'مميز',
                price: '29 \$ / شهرياً',
                isActive: activePlan == 'مميز',
                features: [
                  'جميع ميزات الخطة المجانية',
                  'ميزة "رافقني" للتتبع الحي أثناء التنقل',
                  'تنبيهات لمواقع متعددة (العمل، البيت، المسار)',
                  'ممتلكاتي (تسجيل عدد غير محدود من الأجهزة)',
                  'سجل بلاغات كامل مع تقارير تفصيلية',
                  'إمكانية تقديم "بلاغ عام" عن الحوادث العامة',
                ],
                icon: Icons.bolt,
                statusTag: currentSubscribedPlan == 'مميز' ? 'نشطة' : null,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'طرق الدفع',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddCardScreen(),
                      ),
                    );

                    if (result != null && result is Map<String, String>) {
                      setState(() {
                        myCards.add(result);
                      });
                    }
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('إضافة'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E4E8C),
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            if (myCards.isEmpty)
              buildEmptyPaymentState()
            else
              ...List.generate(myCards.length, (index) {
                return GestureDetector(
                  onTap: () => setState(() => selectedPaymentIndex = index),
                  child: buildPaymentMethodTile(
                    title: myCards[index]['title']!,
                    subtitle: myCards[index]['subtitle']!,
                    isSelected: selectedPaymentIndex == index,
                  ),
                );
              }),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed:
                    (activePlan == 'مميز' && selectedPaymentIndex == null)
                    ? null
                    : () {
                        setState(() {
                          currentSubscribedPlan = activePlan;
                        });
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF11458A),
                  disabledBackgroundColor: Colors.grey.shade300,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'اشترك الآن',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
