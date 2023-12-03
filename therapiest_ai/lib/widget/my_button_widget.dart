import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.w,
  });
  final Function() onPressed;
  final Widget child;
  final double w;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: w,
        child: ElevatedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: onPressed,
            child: child));
  }
}
