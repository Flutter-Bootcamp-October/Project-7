import 'package:learning_path_openai/model/course_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseFunction {
  // -------------- add the course path in database --------------

  addCoursePath(
      {required String courseName, required String coursePath}) async {
    final supabase = Supabase.instance.client;

    if (courseName.isEmpty) {
      return;
    } else if (coursePath.contains('sorry')) {
      return;
    } else if (courseName.isNotEmpty && coursePath.isNotEmpty) {
      await supabase
          .from('courses_path')
          .insert({'course_name': courseName, 'course_path': coursePath});
    } else {
      return;
    }
  }

  // -------------- get all the courses and path from database --------------

  Future getCoursePath() async {
    final data =
        await Supabase.instance.client.from('courses_path').select('*');

    ///print(data);
    List<CourseModel> coursePathList = [];
    for (var element in data) {
      coursePathList.add(CourseModel.fromJson(element));
    }
    return coursePathList;
  }

  // -------------- delete courses and path from database --------------

  deleteCoursePath({required int courseID}) async {
    final supabase = Supabase.instance.client;
    await supabase.from('courses_path').delete().eq('course_id', courseID);
  }
}
