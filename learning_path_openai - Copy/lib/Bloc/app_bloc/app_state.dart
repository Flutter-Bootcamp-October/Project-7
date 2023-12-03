import 'package:learning_path_openai/model/course_model.dart';

abstract class AppState {}

final class InitialAppState extends AppState {}

final class UpdateAppState extends AppState {
  final String responeContent;

  UpdateAppState(this.responeContent);
}

final class GetCoursesPathAppState extends AppState {
  final List<CourseModel> coursePath;

  GetCoursesPathAppState(this.coursePath);
}

final class ErrorAppState extends AppState {
  final String errorMessage;

  ErrorAppState(this.errorMessage);
}
