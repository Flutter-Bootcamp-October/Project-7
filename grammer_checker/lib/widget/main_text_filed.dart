import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainTextFiled extends StatelessWidget {
  MainTextFiled({super.key, required this.controller});

  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: TextField(
        controller: controller,
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
                const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            hintText: "Enter text to be corrected",
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6))),
      ),
    );
  }
}
