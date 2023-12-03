import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 70, left: 70),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.green[50],
          minimumSize: Size(double.infinity, 40),
        ),
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
