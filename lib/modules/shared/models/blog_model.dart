class BlogModel {
  String id;
  String image;
  String topic;
  String title;
  String content;

  BlogModel({
    required this.id,
    this.image = '',
    this.topic = '',
    this.title = '',
    this.content = '',
  });

  static BlogModel fromJson(Map<String, dynamic> jsonValue) {
    return BlogModel(
      id: jsonValue['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
