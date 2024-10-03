class ClubModel {
  String id;
  String name;
  String logo;

  ClubModel({
    required this.id,
    this.name = '',
    this.logo = '',
  });

  static ClubModel fromJson(Map<String, dynamic> jsonValue) {
    return ClubModel(
      id: jsonValue['id'] as String,
      name: jsonValue['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }
}
