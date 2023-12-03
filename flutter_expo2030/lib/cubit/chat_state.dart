

class ChatMessageData {
  final String title;
  final bool isUser;

  ChatMessageData({required this.title, required this.isUser});
}

class ChatState {
  final List<ChatMessageData> chatMessages;
  final bool isLoading;

  ChatState({
    required this.chatMessages,
    required this.isLoading,
  });


}
