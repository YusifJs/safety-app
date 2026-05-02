import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 117,
      height: 117,
      child: GestureDetector(
        child: CircleAvatar(
          backgroundImage: AssetImage("assets/images/Group 289211.png"),
        ),
      ),
    );
  }
}
