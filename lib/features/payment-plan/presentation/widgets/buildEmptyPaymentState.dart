import 'package:flutter/material.dart';

Widget buildEmptyPaymentState() {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.grey.shade50,
      borderRadius: BorderRadius.circular(12),
      border: Border.all(color: Colors.grey.shade200),
    ),
    child: const Center(
      child: Text(
        'لم يتم إضافة طرق دفع حتى الآن',
        style: TextStyle(color: Colors.grey),
      ),
    ),
  );
}
