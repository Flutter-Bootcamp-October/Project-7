import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapy_event.dart';
import 'package:therapiest_ai/bloc/therapy_bloc/therapy_state.dart';
import 'package:therapiest_ai/data/data.dart';
import 'package:therapiest_ai/global/globals.dart';
import 'package:therapiest_ai/services/chat_gpt_services.dart';

class TherapyBloc extends Bloc<TherapyEvent, TherapyState> {
  TherapyBloc() : super(InitialState()) {
    on<UserMessageEvent>((event, emit) async {
      emit(LoadingState());
      try {
        final res = await ChatWithAI().getBotMessage(event.userMessage);
        chatList.add(res);
        emit(ResponseMessageState(botMessage: res));
      } catch (error) {
        emit(ErrorState());
      }
    });
    on<UserGenderSelectionEvent>((event, emit) async {
      currentUserGender = event.choice;
      emit(UpdateGenderSelection());
    });
    on<UserSetLanguageEvent>((event, emit) async {
      if (event.isArabic) {
        preferedLang = " System only speaks Arabic.";
        if (!currentSystem.contains(preferedLang)) {
          currentSystem = preferedLang + currentSystem;
        }
      } else {
        if (currentSystem.contains(preferedLang)) {
          print("here");
          currentSystem = currentSystem.replaceFirst(preferedLang, "");
        }
        preferedLang = "";
      }
      print(currentSystem);
      emit(UpdateLanguageSelection(isArabic: event.isArabic));
    });
    on<UserSelectedSystemEvent>((event, emit) async {
      if (event.isSara) {
        currentSystem = systemSara;
        if (event.isSpecalized) {
          currentSystem = systemSaraDepression;
          emit(UpdateTherapiestCard(
              isSpecalized: event.isSpecalized, colorCard: true, isSara: true));
        } else {
          emit(UpdateTherapiestCard(
              isSpecalized: event.isSpecalized, colorCard: true, isSara: true));
        }
      } else {
        if (event.isSara == false) {
          currentSystem = systemAhmad;
          if (event.isSpecalized) {
            currentSystem = systemAhmadAnexitey;
            emit(UpdateTherapiestCard(
                isSpecalized: event.isSpecalized,
                colorCard: true,
                isSara: false));
          }
        }
        emit(UpdateTherapiestCard(
            isSpecalized: event.isSpecalized, colorCard: true, isSara: false));
      }
    });
  }
}
