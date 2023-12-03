import 'package:bloc/bloc.dart';
import 'package:grammer_checker/bloc/home_bloc/home_event.dart';
import 'package:grammer_checker/bloc/home_bloc/home_state.dart';
import 'package:grammer_checker/data/global.dart';
import 'package:grammer_checker/service/api_networking.dart';

class HomeBolc extends Bloc<HomeEvent, HomeState> {
  var answerGPT = "";
  HomeBolc() : super(HomeInitialState()) {
    on<CheckEvent>(
      (event, emit) async {
        answerGPT =
            await ApiNetorkingg().grammarCorrection(msg: event.askController);
        //print(answerGPT);
        emit(SuccessState(answerGPT: answerGPT));
      },
    );

    on<AddToFavoriteEvent>((event, emit) {
      if (answerGPT.isNotEmpty) {
        if (favorite.contains(answerGPT)) {
          emit(ErrorAddState(errorMassage: "Already Saved to favorite"));
        } else {
          favorite.add(answerGPT);
          emit(SuccessAddState(successMassage: "Success saved to favorite"));
        }
      }
    });
  }
}
