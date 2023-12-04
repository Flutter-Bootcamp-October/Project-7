import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/blocs/chat_bloc/chat_cubit.dart';
import 'package:shopingpriject/widgets/chat.dart';

class ChatGPT extends StatelessWidget {
  final TextEditingController _messageController = TextEditingController();

  ChatGPT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset("lib\\assets\\imges\\img12.png"),
          // Chat Messages Display
          Expanded(
            child: BlocBuilder<ChatCubit, List<ChatMessage>>(
              builder: (context, chatMessages) {
                return ListView.builder(
                  itemCount: chatMessages.length,
                  itemBuilder: (context, index) {
                    final message = chatMessages[index];
                    return ListTile(
                      title: Align(
                        alignment: message.isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          color:
                              message.isUser ? Colors.blue : Colors.grey[300],
                          child: Text(
                            message.message,
                            style: TextStyle(
                                color: message.isUser
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          // Message Input Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    context
                        .read<ChatCubit>()
                        .sendMessage(_messageController.text.trim());
                    _messageController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
