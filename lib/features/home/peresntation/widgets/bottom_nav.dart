import 'package:flutter/material.dart';
import 'package:safety_app/features/home/peresntation/pages/help_and_support_pages/help_page.dart';
import 'package:safety_app/features/home/peresntation/pages/home_page.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final List<Widget> _screens = [
    const HomePage(),
    const HelpPage(),
    const HelpPage(),
    const HelpPage(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final items = [
      {"icon": Icons.home_outlined, "label": "الرئيسية"},
      {"icon": Icons.inventory_2_outlined, "label": "ممتلكاتي"},
      {"icon": Icons.help_outline, "label": "المساعدة"},
      {"icon": Icons.person_outline, "label": "صفحتي"},
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 15,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            final isSelected = _selectedIndex == index;

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xff174C8A).withOpacity(0.12)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Icon(
                      items[index]["icon"] as IconData,
                      color: isSelected ? const Color(0xff174C8A) : Colors.grey,
                      size: 24,
                    ),
                    if (isSelected) ...[
                      const SizedBox(width: 8),
                      Text(
                        items[index]["label"] as String,
                        style: const TextStyle(
                          color: Color(0xff174C8A),
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  //================ Custom Bottom Nav ================
}
