import 'package:bloc/bloc.dart';
import 'package:grammer_checker/bloc/auth_bloc/auth_event.dart';
import 'package:grammer_checker/bloc/auth_bloc/auth_state.dart';
import 'package:grammer_checker/data/global.dart';
import 'package:grammer_checker/model/user.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitialState()) {
    on<SignUpEvent>(
      (event, emit) {
        bool isFound = false;

        if (event.name.trim().isNotEmpty &&
            event.email.trim().isNotEmpty &&
            event.password.trim().isNotEmpty) {
          if (event.name.trim().length > 2) {
            if (event.email.trim().contains('@')) {
              for (var user in userList) {
                if (user.name == event.name || user.email == event.email) {
                  isFound = true;
                  emit(ErrorState(
                      errorMassage:
                          "You have a registered account, try sign in"));
                }
              }
              if (!isFound) {
                User newUser = User(
                  name: event.name,
                  password: event.password,
                  email: event.email,
                );
                userList.add(newUser);
                emit(SuccessSignUpState(
                    successMessage: "Account successfully created"));
              }
            }
            emit(
                ErrorState(errorMassage: "Please enter a valid email address"));
          }
          emit(ErrorState(errorMassage: "Please enter a valid name"));
        }
        emit(ErrorState(errorMassage: "Please enter all fields"));
      },
    );

    on<SignInEvent>(
      (event, emit) {
        if (event.email.trim().isNotEmpty && event.password.trim().isNotEmpty) {
          for (var user in userList) {
            //print(user.email);
            if (user.email == event.email && user.password == event.password) {
              //print("1");
              currentUser = user;
              emit(SuccessSignInState());
              //print("2");
            } else {
              emit(ErrorState(
                  errorMassage: "Incorrect name or password. Try again"));
            }
          }
        } else {
          emit(ErrorState(errorMassage: "Please enter all fields"));
        }
      },
    );
  }
}
