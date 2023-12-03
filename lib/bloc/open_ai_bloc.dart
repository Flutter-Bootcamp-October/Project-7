import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:openai/Storage/Storage.dart';
import 'package:openai/api/chat_api.dart';
import 'package:openai/utils/saveimage.dart';
import 'package:openai/wgaet/chat.dart';

part 'open_ai_event.dart';
part 'open_ai_state.dart';

class OpenAiBloc extends Bloc<OpenAiEvent, OpenAiState> {
  final DallEClient _dallEClient = DallEClient(' api kay :>');

  OpenAiBloc() : super(OpenAiInitialState()) {
    on<SendMessageEvent>(_onSendMessageEvent);
  }

  Future<void> _onSendMessageEvent(
      SendMessageEvent event, Emitter<OpenAiState> emit) async {
    var newMessages = List<ChatMessage>.from(state.messages);
    newMessages.add(ChatMessage(isUser: true, message: event.message));

    // Emit a loading state
    emit(OpenAiLoadingState(newMessages));

    try {
      String imageUrl = await _dallEClient.generateImage(event.message);
      newMessages
          .add(ChatMessage(isUser: false, message: '', imageUrl: imageUrl));
      String localImagePath =
          await saveImage(url: imageUrl, nameImage: 'uniqueImageName');
      await SupabaseStorage().uploadImage(pathImageLocal: localImagePath);
    } catch (e) {
      newMessages.add(const ChatMessage(
          isUser: false, message: 'Failed to generate or upload image.'));
    }

    emit(OpenAiUpdatedState(newMessages));
  }
}
