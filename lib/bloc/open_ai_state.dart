part of 'open_ai_bloc.dart';

@immutable
abstract class OpenAiState {
  List<ChatMessage> get messages => [];
}

class OpenAiInitialState extends OpenAiState {
  @override
  final List<ChatMessage> messages;

  OpenAiInitialState({this.messages = const []});
}

class OpenAiUpdatedState extends OpenAiState {
  @override
  final List<ChatMessage> messages;

  OpenAiUpdatedState(this.messages);
}

class OpenAiLoadingState extends OpenAiState {
  @override
  final List<ChatMessage> messages;

  OpenAiLoadingState(this.messages);
}
