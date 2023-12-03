import 'package:flutter/material.dart';

class PrimaryTextFiled extends StatelessWidget {
  const PrimaryTextFiled(
      {super.key,
      required this.hint,
      required this.labelText,
      this.isPassword = false,
      required this.controller});

  final String hint;
  final String labelText;
  final bool isPassword;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      child: TextField(
        controller: controller,
        obscureText: isPassword ? true : false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(width: 1, color: Colors.grey.withOpacity(0.3)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:
                BorderSide(width: 1, color: Colors.grey.withOpacity(0.3)),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 18, horizontal: 22),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: labelText,
          labelStyle: const TextStyle(fontSize: 16, color: Colors.grey),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
        ),
      ),
    );
  }
}
