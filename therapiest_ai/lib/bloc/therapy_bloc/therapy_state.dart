abstract class TherapyState {}

class InitialState extends TherapyState {}

class ResponseMessageState extends TherapyState {
  final String botMessage;

  ResponseMessageState({required this.botMessage});
}

class LoadingState extends TherapyState {}

class ErrorState extends TherapyState {}

class UpdateGenderSelection extends TherapyState {}

class UpdateLanguageSelection extends TherapyState {
  final bool isArabic;

  UpdateLanguageSelection({required this.isArabic});
}

class UpdateTherapiestCard extends TherapyState {
  final bool isSara;
  final bool isSpecalized;
  final bool colorCard;

  UpdateTherapiestCard({required this.isSara, required this.isSpecalized, required this.colorCard});

}
