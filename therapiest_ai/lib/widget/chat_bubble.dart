import 'package:flutter/material.dart';
import 'package:therapiest_ai/consts/colors.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    super.key,
    required this.text,
    required this.isBotText,
  });
  final String text;
  final bool isBotText;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isBotText ? Alignment.topLeft : Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: text.length > 10
              ? MediaQuery.of(context).size.width / 2 - 20
              : 80,
          decoration: BoxDecoration(
              color: isBotText ? chatBotColor : Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Wrap(
                  children: [Text(text, style: const TextStyle(fontSize: 16))]),
            ),
          ),
        ),
      ),
    );
  }
}
