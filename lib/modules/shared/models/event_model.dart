class EventModel {
  String id;
  String image;

  EventModel({
    required this.id,
    this.image = '',
  });

  static EventModel fromJson(Map<String, dynamic> jsonValue) {
    return EventModel(
      id: jsonValue['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
