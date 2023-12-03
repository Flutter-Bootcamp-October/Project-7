import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_path_openai/Bloc/theme_bloc/app_event.dart';
import 'package:learning_path_openai/Bloc/theme_bloc/app_state.dart';
import 'package:learning_path_openai/utils/theme/app_theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(GetThemeState(appThemeMap["light"]!)) {
    on<ChangeThemeEvent>((event, emit) {
      emit(GetThemeState(appThemeMap[event.themeText]!));
    });
  }
}
