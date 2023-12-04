import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  final String label;
  String? hint;
  final IconData icon;
  final bool obscureText;

  CustomTextField({
    required this.label,
    this.hint,
    required this.icon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Container(
          width: 1000,
          child: TextField(
            obscureText: obscureText,
            decoration: InputDecoration(
                fillColor: Color.fromARGB(255, 255, 255, 255),
                filled: true,
                labelText: label,
                labelStyle: TextStyle(color: Colors.grey[800]),
                hintText: hint,
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: Icon(icon, color: Color.fromARGB(98, 97, 97, 97)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always),
          ),
        ),
      ),
    );
  }
}
