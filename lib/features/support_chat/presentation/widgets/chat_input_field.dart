import 'package:flutter/material.dart';
import 'package:safety_app/core/utils/imports.dart';

class ChatInputField extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSend;

  const ChatInputField({
    super.key,
    required this.controller,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SafeArea(
        top: false,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: TextField(
            controller: controller,
            textAlign: TextAlign.right,
            cursorColor: const Color(0xFF164E8D),
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            decoration: InputDecoration(
              hintText: "...اكتب رسالتك هنا",
              hintStyle: const TextStyle(
                color: AppColors.darkGrey,
                fontSize: 16,
              ),

              filled: true,
              fillColor: AppColors.white,

              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 14,
              ),

              prefixIcon: Padding(
                padding: const EdgeInsets.all(6),

                child: GestureDetector(
                  onTap: onSend,
                  child: Container(
                    height: 48,
                    width: 52,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
              ),

              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Color(0xFFD4D4D4), width: 1.18),
              ),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: AppColors.blue, width: 1.18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
