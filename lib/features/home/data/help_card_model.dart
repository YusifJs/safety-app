import 'package:flutter/material.dart';

class HelpCardModel {
  final String icon;
  final String title;
  final String description;
  final Color color;
  final Widget page;
  const HelpCardModel({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
    required this.page,
  });
}
