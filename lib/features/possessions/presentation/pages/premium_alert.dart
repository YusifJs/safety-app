import 'package:flutter/material.dart';

class PremiumAlert extends StatelessWidget {
  const PremiumAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min, // عشان ياخد مساحة المحتوى بس
          children: [
            // أيقونة القفل
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xff174C8A),
              child: Icon(Icons.lock_outline, color: Colors.white, size: 40),
            ),
            const SizedBox(height: 20),

            // العنوان
            const Text(
              "تنبيه: ميزة 'إضافة أكثر من ممتلك' حصرية لمشتركين سلام مميز",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 15),

            // الوصف
            const Text(
              "أنت تستخدم حالياً النسخة المجانية. للاستفادة من خاصية ممتلكاتي بشكل كامل، يرجى الاشتراك في باقة 'مميز'.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 25),

            // زرار الاشتراك
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff174C8A),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("اشترك في سلام مميز", style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(height: 10),

            // زرار العودة
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Color(0xff174C8A)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text("العودة للرئيسية", style: TextStyle(color: Color(0xff174C8A), fontSize: 16, fontWeight: FontWeight.bold   )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}