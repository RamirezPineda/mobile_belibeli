import 'package:flutter/material.dart';

export 'input_decoration.ui.dart';

InputDecoration inputDecoration({
  required String hintText,
  required String labelText,
  IconData? suffixIcon,
  bool disabled = false,
}) {
  return InputDecoration(
    hintText: hintText,
    labelText: labelText,
    alignLabelWithHint: true,
    hintStyle: TextStyle(color: Colors.grey[500]),
    labelStyle: TextStyle(color: Colors.grey[500]),
    // suffixIcon: Icon(suffixIcon, color: Colors.grey[500]),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade400),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: disabled
          ? BorderSide(color: Colors.grey.shade400)
          : BorderSide(color: Colors.grey.shade800),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade500),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red.shade500),
      borderRadius: BorderRadius.circular(12),
    ),
    filled: true,
    fillColor: disabled ? Colors.grey.shade100 : Colors.white,
  );
}
