import 'package:flutter/material.dart';

import 'package:safety_app/features/possessions/presentation/widgets/add_property_button.dart';
import 'package:safety_app/features/possessions/presentation/widgets/header.dart';
import 'package:safety_app/features/possessions/presentation/widgets/property_card.dart';


class PossessionsScreen extends StatelessWidget {
  const PossessionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF8FAFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Header(text: 'ممتلكاتي'),
              const SizedBox(height: 20),

              Expanded(
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: const [
                    PropertyCard(
                      title: "الخاص بي iPhone",
                      serialNumber: "A1B2C3D4E5F6",
                      icon: Icons.phone_android,
                    ),
                    PropertyCard(
                      title: "My car",
                      serialNumber: "1HGCM82633A",
                      icon: Icons.directions_car_filled_outlined,
                    ),
                    PropertyCard(
                      title: "MacBook Pro",
                      serialNumber: "DMPQK1A1F19J",
                      icon: Icons.laptop_mac,
                    ),
                    PropertyCard(
                      title: "Smart watch",
                      serialNumber: "R58M31ABC1",
                      icon: Icons.watch_rounded,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              const AddPropertyButton(),
            ],
          ),
        ),
      ),
    );
  }
}