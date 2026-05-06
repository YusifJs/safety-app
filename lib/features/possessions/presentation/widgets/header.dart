import 'package:flutter/material.dart';
import 'package:safety_app/features/widgets/notification_button.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          const Icon(Icons.arrow_back),
          const SizedBox(width: 6),
          const Image(
            image: AssetImage('assets/bird.png'),
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const NotificationButton(),
        ],
      ),
    );
  }
}