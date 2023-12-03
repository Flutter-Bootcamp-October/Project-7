import 'package:flutter/material.dart';
import 'package:therapiest_ai/consts/colors.dart';

class MyTextFeild extends StatelessWidget {
  const MyTextFeild({
    super.key,
    required this.myController,
    required this.hint,
  });

  final TextEditingController myController;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return TextField(
        textCapitalization: TextCapitalization.words,
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: scaffoldColor2),
            borderRadius: BorderRadius.circular(20), //<-- SEE HERE
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 3, color: scaffoldColor2),
            borderRadius: BorderRadius.circular(20), //<-- SEE HERE
          ),
          hintText: hint,
          filled: true,
          fillColor: Colors.white,
        ),
        controller: myController);
  }
}
