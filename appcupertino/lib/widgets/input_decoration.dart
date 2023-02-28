import 'package:appcupertino/const/colors.dart';
import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
      labelText: labelText,
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsMyApp.secondarycolor)),
      focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
              style: BorderStyle.solid,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: ColorsMyApp.primarycolor,
              width: 2)),
      hintText: hintText,
    );
  }
}
