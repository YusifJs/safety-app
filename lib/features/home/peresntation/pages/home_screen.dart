import 'package:flutter/material.dart';
import 'package:safety_app/core/routing/routes.dart';
import 'package:safety_app/features/home/peresntation/widgets/bottom_nav.dart';
import '../widgets/action_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFF),
      appBar: _buildAppBar(),
      bottomNavigationBar: const BottomNav(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _buildWarningBanner(),
            const SizedBox(height: 20),

            _buildSOSButton(),
            const SizedBox(height: 25),

            Row(
              children: [
                Expanded(
                  child: ActionCard(
                    title: "بلاغ عام",
                    icon: Icons.description_outlined,
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ActionCard(
                    title: "رافقني",
                    icon: Icons.location_on_outlined,
                    onTap: () {
                      Navigator.pushNamed(context, Routes.followMeScreen);
                    },
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

            _buildRecentActivitiesHeader(),
            const SizedBox(height: 15),

            _buildActivityItem(
              "بلاغ تحرش",
              "اليوم، 10:30 صباحاً",
              "قيد المعالجة",
              Colors.orange,
            ),

            _buildActivityItem(
              "بلاغ سرقة",
              "أمس، 08:15 مساءً",
              "مكتمل",
              Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  //================ AppBar ================

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: const Icon(Icons.notifications_none, color: Colors.grey),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "مرحباً، بان الرقب",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "ابق في أمان",
                style: TextStyle(color: Color(0xff174C8A), fontSize: 20),
              ),
            ],
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/1775826274282 1.png'),
          ),
        ],
      ),
    );
  }

  //================ Warning Banner ================

  Widget _buildWarningBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Icon(Icons.arrow_back_ios, size: 14, color: Colors.black54),
          Spacer(),
          Text("أكمل ملفك الشخصي لضمان حمايتك", style: TextStyle(fontSize: 20)),
          SizedBox(width: 10),
          Icon(Icons.warning_amber_rounded, color: Colors.orange),
        ],
      ),
    );
  }

  //================ SOS Button ================

  Widget _buildSOSButton() {
    return Container(
      width: 220,
      height: 220,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.red.withOpacity(0.1),
      ),
      child: Center(
        child: Container(
          width: 180,
          height: 180,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xffE63946),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shield_outlined, color: Colors.white, size: 50),
              Text(
                "SOS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "اضغط مطولاً لإرسال إشارة استغاثة فورية",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //================ Recent Activities Header ================

  Widget _buildRecentActivitiesHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "عرض الكل",
          style: TextStyle(color: Color(0xff174C8A), fontSize: 12),
        ),
        Text(
          "النشاطات الأخيرة",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  //================ Activity Item ================

  Widget _buildActivityItem(
    String title,
    String time,
    String status,
    Color statusColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: statusColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              status,
              style: TextStyle(color: statusColor, fontSize: 15),
            ),
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                time,
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
            ],
          ),
          const SizedBox(width: 15),
          const CircleAvatar(
            backgroundColor: Color(0xffF1F4F7),
            child: Icon(Icons.insert_drive_file_outlined, size: 20),
          ),
        ],
      ),
    );
  }

  //================ Custom Bottom Nav ================
}
