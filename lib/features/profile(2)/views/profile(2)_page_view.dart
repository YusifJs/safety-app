import 'package:flutter/material.dart';
import 'package:safety_app/features/profile(2)/views/widgets/buttom_nav.dart';
import 'package:safety_app/features/profile(2)/views/widgets/profile(2)_page_view_body.dart';

class ProfileSecondPageView extends StatelessWidget {
  const ProfileSecondPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileSecondPageViewBody(),
      bottomNavigationBar: BottomSecondNav(),
    );
  }
}
