abstract class AppEvent {}

final class UpdateAppEvent extends AppEvent {
  final String courseName;

  UpdateAppEvent(this.courseName);
}

final class AddFavPathCourseAppEvent extends AppEvent {
  final String courseName;
  final String coursePath;

  AddFavPathCourseAppEvent(this.courseName, this.coursePath);
}

final class GetFavPathCourseAppEvent extends AppEvent {}

final class DeletePathCourseAppEvent extends AppEvent {
  final int courseID;

  DeletePathCourseAppEvent(this.courseID);
}
