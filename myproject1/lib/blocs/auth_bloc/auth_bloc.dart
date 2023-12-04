import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shopingpriject/data/global.dart';
import 'package:shopingpriject/extenstions/reg.dart';
import 'package:shopingpriject/models/user_model.dart';


part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<SignUpEvent>((event, emit) {
      bool isMatched = false;

      // تحقق من كل المدخلات غير فارغة
      if (event.name.isNotEmpty &&
          event.email.isNotEmpty &&
          event.password.isNotEmpty &&
          event.confirmPassword.isNotEmpty) {
        // تحقق من تتطابق الباسسورد
        if (event.password == event.confirmPassword) {
          if (event.email.isValidEmail) {
            for (var user in userList) {
              if (user.email == event.email) {
                isMatched = true;
              }
            }
            if (!isMatched) {
              User newUser = User(
                  name: event.name,
                  email: event.email,
                  password: event.password);

              userList.add(newUser);
              emit(SignUpSuccessedState());
            } else {
              isMatched = false;
              emit(ErrorState("Email is used"));
            }
          } else {
            emit(ErrorState("Email is not vaild"));
          }
        } else {
          emit(ErrorState("PASSWORD NOT MATCH"));
        }
      } else {
        emit(ErrorState("Please insert all text fields"));
      }
    });

    on<LoginEvent>((event, emit) {
      bool isFound = false;
      for (var user in userList) {
        if (user.email == event.email && user.password == event.password) {
          currentUser = user;
          isFound = true;
          emit(LoginSuccessedState());
        }
      }
      if (!isFound) {
        emit(ErrorState("email or password are incorrect"));
      }
    });
  }
}
