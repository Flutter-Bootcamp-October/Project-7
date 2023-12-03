import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openai/bloc/open_ai_bloc.dart';

class OpenAi extends StatelessWidget {
  const OpenAi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _messageController = TextEditingController();

    void _sendMessage() {
      String userMessage = _messageController.text.trim();
      if (userMessage.isNotEmpty) {
        context.read<OpenAiBloc>().add(SendMessageEvent(userMessage));
        _messageController.clear();
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Expanded(
              child: BlocBuilder<OpenAiBloc, OpenAiState>(
                builder: (context, state) {
                  if (state is OpenAiLoadingState) {
                    // Display a loading indicator when in loading state
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is OpenAiInitialState ||
                      state is OpenAiUpdatedState) {
                    return ListView.builder(
                      itemCount: state.messages.length,
                      itemBuilder: (context, index) {
                        return state.messages[index];
                      },
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 25, 0, 255),
                        borderRadius: BorderRadius.circular(20)),
                    child: IconButton(
                      icon: const Icon(Icons.send,
                          color: Color.fromARGB(255, 255, 255, 255)),
                      onPressed: _sendMessage,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
