class CourseModel {
  int? courseId;
  String? courseName;
  String? coursePath;

  CourseModel({this.courseId, this.courseName, this.coursePath});

  CourseModel.fromJson(Map<String, dynamic> json) {
    courseId = json['course_id'];
    courseName = json['course_name'];
    coursePath = json['course_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['course_id'] = this.courseId;
    data['course_name'] = this.courseName;
    data['course_path'] = this.coursePath;
    return data;
  }
}
