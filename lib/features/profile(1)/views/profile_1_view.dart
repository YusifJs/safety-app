import 'package:flutter/material.dart';
import 'package:safety_app/features/profile(1)/views/widgets/buttom_nav.dart';
import 'package:safety_app/features/profile(1)/views/widgets/profile_1_view_body.dart';

class Profile1View extends StatelessWidget {
  const Profile1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Profile1ViewBody(), bottomNavigationBar: BottomNav());
  }
}
