abstract class HomeState {}

final class HomeInitialState extends HomeState {}

final class SuccessState extends HomeState {
  final String answerGPT;

  SuccessState({required this.answerGPT});
}

final class SuccessAddState extends HomeState {
  final String successMassage;

  SuccessAddState({required this.successMassage});
}

final class ErrorAddState extends HomeState {
  final String errorMassage;

  ErrorAddState({required this.errorMassage});
}
