abstract class AuthState {}

final class AuthInitialState extends AuthState {}

final class SuccessSignUpState extends AuthState {
  final String successMessage;
  SuccessSignUpState({required this.successMessage});
}

final class SuccessSignInState extends AuthState {}

final class ErrorState extends AuthState {
  final String errorMassage;

  ErrorState({required this.errorMassage});
}
