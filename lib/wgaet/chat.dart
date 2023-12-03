import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String message;
  final bool isUser;
  final String? imageUrl;

  const ChatMessage({
    Key? key,
    required this.message,
    required this.isUser,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isImage = imageUrl != null;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (isImage)
            Image.network(
              imageUrl!,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            )
          else
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:
                    isUser ? Colors.blue : const Color.fromARGB(255, 6, 32, 54),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
                maxLines: null,
                softWrap: true,
                overflow: TextOverflow.clip,
              ),
            ),
        ],
      ),
    );
  }
}