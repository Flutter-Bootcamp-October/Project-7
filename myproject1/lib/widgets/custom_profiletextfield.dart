import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileTextField extends StatefulWidget {
  final String label;
  IconData? icon;
  final TextEditingController? controller;

  ProfileTextField(
      {super.key, required this.label, this.icon, this.controller,  this.text});
final String? text;
  @override
  State<ProfileTextField> createState() => _ProfileTextFieldState();
}

class _ProfileTextFieldState extends State<ProfileTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: TextField(
        
        controller: widget.controller,
        decoration: InputDecoration(
          labelText: widget.label,
          suffixIcon: Icon(
            widget.icon,
            color: Colors.grey,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
      ),
    );
  }
}
