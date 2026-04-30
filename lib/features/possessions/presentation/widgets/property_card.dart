import 'package:flutter/material.dart';
class PropertyCard extends StatelessWidget {
  final String title;
  final String serialNumber;
  final IconData icon;

  const PropertyCard({
    super.key,
    required this.title,
    required this.serialNumber,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          /// property icon
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xffE8F0F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: const Color(0xff174C8A),
              size: 30,
            ),
          ),

          const SizedBox(width: 15),

          /// details قريب من الأيقونة
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff174C8A),
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Text(
                    "الرقم التسلسلي: ",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffF1F4F7),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      serialNumber,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(0xff174C8A),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          const Spacer(),

          /// delete icon on far right
          const Icon(
            Icons.delete_outline,
            color: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}