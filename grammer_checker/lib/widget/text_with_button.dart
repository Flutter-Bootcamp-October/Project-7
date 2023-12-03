import 'package:flutter/material.dart';

class TextWithButton extends StatelessWidget {
  const TextWithButton(
      {super.key,
      required this.title,
      required this.onTap,
      required this.textButton});

  final String title;
  final String textButton;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey.withOpacity(0.9),
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              textButton,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff5F5BFF),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
