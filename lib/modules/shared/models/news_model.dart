class NewsModel {
  String id;
  String title;
  String type;
  String html;

  NewsModel({
    required this.id,
    this.title = '',
    this.type = '',
    this.html = '',
  });

  static NewsModel fromJson(Map<String, dynamic> jsonValue) {
    return NewsModel(
      id: jsonValue['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
