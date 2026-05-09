import 'dart:ui';

class PaymentmethodModel {
  final String title;
  final String price;
  final List<String> features;
  final bool isActive;
  final Color themeColor;

  PaymentmethodModel({
    required this.title,
    required this.price,
    required this.features,
    this.isActive = false,
    this.themeColor = const Color(0xFF1E4E8C),
  });
}
