
import 'package:bloc/bloc.dart';
import 'package:flutter_expo2030/cubit/chat_state.dart';
import 'package:flutter_expo2030/networking/nerworking_api.dart';


class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState(chatMessages: [], isLoading: false));

  void sendMessage(String message) async {
    emit(ChatState(chatMessages: [], isLoading: true));

    final answerGpt = await Networking().connectGpt(msg: message);

    final newChatMessages = [
      ...state.chatMessages,
      ChatMessageData(title: answerGpt, isUser: false),
      ChatMessageData(title: message, isUser: true),
    ];

    emit(ChatState(chatMessages: newChatMessages, isLoading: false));
  }
}
