import 'package:flutter/material.dart';
import 'package:safety_app/features/possessions/presentation/widgets/header.dart';

class AddPropertyScreen extends StatefulWidget {
  const AddPropertyScreen({super.key});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xffF1F4F7),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Header(text: 'اضف ممتلك جديد'),

                const SizedBox(height: 28),

                const Text(
                  "نوع الممتلك *",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 16),

                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 1.35,
                  children: [
                    _buildCategoryCard(0, "هاتف ذكي", Icons.phone_android),
                    _buildCategoryCard(1, "سيارة", Icons.directions_car),
                    _buildCategoryCard(2, "لابتوب", Icons.laptop),
                    _buildCategoryCard(3, "ساعة ذكية", Icons.watch),
                    _buildCategoryCard(4, "تابلت", Icons.tablet_android),
                    _buildCategoryCard(5, "سماعات", Icons.headphones),
                  ],
                ),

                const SizedBox(height: 26),

                const Text(
                  "اسم الممتلك *",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,
                  ),
                ),

                const SizedBox(height: 10),

                _buildTextField("مثال iPhone 15 Pro"),

                const SizedBox(height: 8),

                const Text(
                  "اختر اسماً يساعدك على تمييز الممتلك بسهولة",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    height: 1.4,
                      fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "الرقم التسلسلي *",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.black87,

                  ),
                ),

                const SizedBox(height: 10),

                _buildTextField("مثال SN123456789"),

                const SizedBox(height: 8),

                const Text(
                  "يساعد في التعريف الدقيق للممتلك عند الحاجة",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    height: 1.4,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const SizedBox(height: 32),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff174C8A),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: const Text(
                      "اضف ممتلك جديد",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(int index, String title, IconData icon) {
    bool isSelected = selectedCategory == index;

    return GestureDetector(
      onTap: () => setState(() => selectedCategory = index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected
                ? const Color(0xff174C8A)
                : Colors.grey.shade200,
            width: 1.8,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.025),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xffE8F0F9),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: const Color(0xff174C8A),
                size: 28,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xff174C8A),
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 15,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}