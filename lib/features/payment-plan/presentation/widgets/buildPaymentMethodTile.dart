import 'package:flutter/material.dart';

Widget buildPaymentMethodTile({
  required String title,
  required String subtitle,
  required bool isSelected,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 12),
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      border: Border.all(
        color: isSelected ? Colors.blue : Colors.grey.shade200,
        width: isSelected ? 2 : 1,
      ),
    ),
    child: ListTile(
      leading: Icon(
        isSelected ? Icons.check_circle : Icons.radio_button_off,
        color: isSelected ? Colors.blue : Colors.grey,
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.credit_card,
        color: Color(0xFF1E4E8C),
        size: 30,
      ),
    ),
  );
}
