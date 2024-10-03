class ThemeModel {
  String id;
  String image;
  String text;

  ThemeModel({
    required this.id,
    this.image = '',
    this.text = '',
  });

  static ThemeModel fromJson(Map<String, dynamic> jsonValue) {
    return ThemeModel(
      id: jsonValue['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
