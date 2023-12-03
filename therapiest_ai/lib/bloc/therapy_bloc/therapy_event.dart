abstract class TherapyEvent {}

class UserMessageEvent extends TherapyEvent {
  final String userMessage;

  UserMessageEvent({required this.userMessage});
}

class UserGenderSelectionEvent extends TherapyEvent {
  final String choice;

  UserGenderSelectionEvent({required this.choice});
}

class UserSetLanguageEvent extends TherapyEvent {
  final bool isArabic;

  UserSetLanguageEvent({required this.isArabic});
}

class UserSelectedSystemEvent extends TherapyEvent {
  final bool isSara;
  final bool isSpecalized;
  final bool isCardSelected;

  UserSelectedSystemEvent(
      {required this.isSara,
      required this.isSpecalized,
      required this.isCardSelected});
}
