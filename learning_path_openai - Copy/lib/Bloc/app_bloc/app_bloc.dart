import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_path_openai/API/opin_ai.dart';
import 'package:learning_path_openai/API/supabase_function.dart';
import 'package:learning_path_openai/Bloc/app_bloc/app_event.dart';
import 'package:learning_path_openai/Bloc/app_bloc/app_state.dart';
import 'package:learning_path_openai/model/course_model.dart';

String response = '';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(InitialAppState()) {
    on<UpdateAppEvent>((event, emit) async {
      emit(LoadingState());

      try {
        final answerGPT =
            await ApiNetworking().connectionGPT(courseName: event.courseName);
        // print("response from BLOC ###### ${response}");
        response = answerGPT;

        emit(UpdateAppState(response));
      } catch (error) {
        emit(ErrorAppState(error.toString()));
      }
    });

    on<AddFavPathCourseAppEvent>((event, emit) async {
      await SupabaseFunction().addCoursePath(
          courseName: event.courseName, coursePath: event.coursePath);
    });

    on<GetFavPathCourseAppEvent>((event, emit) async {
      try {
        final List<CourseModel> coursePath =
            await SupabaseFunction().getCoursePath();

        emit(GetCoursesPathAppState(coursePath));
      } catch (error) {
        emit(ErrorAppState(error.toString()));
      }
    });

    on<DeletePathCourseAppEvent>((event, emit) async {

      try {
        await SupabaseFunction().deleteCoursePath(
          courseID: event.courseID,
        );

        final List<CourseModel> coursePath =
            await SupabaseFunction().getCoursePath();

        emit(GetCoursesPathAppState(coursePath));
      } catch (error) {
        emit(ErrorAppState(error.toString()));
      }
    });
  }
}
