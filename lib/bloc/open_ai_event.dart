part of 'open_ai_bloc.dart';

@immutable
abstract class OpenAiEvent {}

class SendMessageEvent extends OpenAiEvent {
  final String message;
  SendMessageEvent(this.message);
}
