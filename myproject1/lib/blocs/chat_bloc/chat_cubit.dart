import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingpriject/api/openai.dart';
import 'package:shopingpriject/widgets/chat.dart';

class ChatCubit extends Cubit<List<ChatMessage>> {
  final DallEClient _dallEClient;

  ChatCubit(this._dallEClient) : super([]);

  void sendMessage(String userMessage) async {
    if (userMessage.isNotEmpty) {
      emit([...state, ChatMessage(isUser: true, message: userMessage)]);

      try {
        String responseMessage = await _dallEClient.chatbot(userMessage);
        emit([...state, ChatMessage(isUser: false, message: responseMessage)]);
      } catch (e) {
        emit([
          ...state,
          ChatMessage(isUser: false, message: 'Failed to get response.')
        ]);
        print('Error: $e');
      }
    }
  }
}
