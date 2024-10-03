class CourseModel {
  String id;

  CourseModel({
    required this.id,
  });

  static CourseModel fromJson(Map<String, dynamic> jsonValue) {
    return CourseModel(
      id: jsonValue['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
