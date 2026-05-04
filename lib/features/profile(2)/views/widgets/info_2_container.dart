import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:safety_app/features/profile(2)/views/widgets/info_2_details_container.dart';

class InfoSecondContainer extends StatelessWidget {
  const InfoSecondContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 340,
      height: 327,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 74,
                height: 23,
                decoration: BoxDecoration(
                  color: Color(0xFF174C8A),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ImageIcon(
                      AssetImage("assets/images/Vector (5).png"),
                      color: Colors.white,
                      size: 12,
                    ),
                    Text(
                      "تعديل",
                      style: GoogleFonts.almarai(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          InfoDetailContainer(
            infoText: "الاسم الكامل",
            detailText: "احمد علي صافي",
            iconInfo: Icons.person,
          ),
          Divider(
            indent: 8,
            endIndent: 8,
            thickness: 1,
            color: Color(0xFFD4D4D4),
          ),
          InfoDetailContainer(
            infoText: "الرقم الوطني",
            detailText: "12345467899",
            iconInfo: Icons.badge,
          ),
          Divider(
            indent: 8,
            endIndent: 8,
            thickness: 1,
            color: Color(0xFFD4D4D4),
          ),
          InfoDetailContainer(
            infoText: "رقم الهاتف",
            detailText: "+966 22 234 2345",
            iconInfo: Icons.phone,
          ),
          Divider(
            indent: 8,
            endIndent: 8,
            thickness: 1,
            color: Color(0xFFD4D4D4),
          ),
          InfoDetailContainer(
            infoText: "فصيلة الدم",
            detailText: "B+",
            iconInfo: Icons.water_drop_outlined,
          ),
        ],
      ),
    );
  }
}
