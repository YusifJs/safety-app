import 'package:safety_app/core/utils/imports.dart';

class EmergencyContactCard extends StatelessWidget {
  final String name;
  final String phone;

  const EmergencyContactCard({
    super.key,
    required this.name,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        // استخدمنا الـ Row عشان العناصر تترص بالعرض
        children: [
          /// 1. الـ Avatar (دلوقتي بقى على الشمال)
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: const Color(0xffE8F0F9),
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Icon(
              Icons.person_outline,
              color: Color(0xff174C8A),
              size: 28,
            ),
          ),

          const SizedBox(width: 14),

          /// 2. الـ Info (الاسم والرقم بيبدأوا من الشمال)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // الكلام يبدأ من الشمال
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xff174C8A),
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  phone,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),

          /// 3. الـ Actions (الأزرار بقت على اليمين خالص)
          Row(
            children: [
              // زرار التعديل
              _buildActionButton(
                icon: Icons.edit_outlined,
                color: const Color(0xff174C8A),
              ),
              const SizedBox(width: 10),
              // زرار الحذف
              _buildActionButton(
                icon: Icons.delete_outline,
                color: Colors.red.shade400,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ميثود صغيرة عشان تمنع تكرار كود الـ Container بتاع الأيقونات
  Widget _buildActionButton({required IconData icon, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        icon,
        color: color,
        size: 22,
      ),
    );
  }
}