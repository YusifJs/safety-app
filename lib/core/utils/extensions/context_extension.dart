import 'package:flutter/material.dart';
import 'package:safety_app/features/widgets/custom_dialog.dart';

extension ContextX on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;

  //Alert dialog Helper
  Future<void> showCustomDialog({
    required Widget dialogImage,
    required String title,
    required String description,
    required String button1,
    required String button2,
  }) {
    return showDialog(
      context: this,
      builder: (context) {
        return CustomDialog(
          dialogImage: dialogImage,
          title: title,
          description: description,
          button1: button1,
          button2: button2,
        );
      },
    );
  }
}
