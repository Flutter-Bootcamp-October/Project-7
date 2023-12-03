import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget(
      {super.key,
      required this.text,
      this.fontWeightText,
      this.colorText,
      this.fontSizeText,
      this.fontFamilyText, this.onPressed});
  final String text;
  final FontWeight? fontWeightText;
  final Color? colorText;
  final double? fontSizeText;
  final String? fontFamilyText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontWeight: fontWeightText,
            color: colorText,
            fontSize: fontSizeText,
            fontFamily: fontFamilyText),
      ),
    );
  }
}


