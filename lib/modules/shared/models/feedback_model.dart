import 'package:metaball_app/modules/shared/models/user_model.dart';

class FeedbackModel {
  String id;
  String content;
  DateTime? createdTime;
  UserModel? author;

  FeedbackModel({
    required this.id,
    this.content = '',
    this.createdTime,
    this.author,
  });

  static FeedbackModel fromJson(Map<String, dynamic> jsonValue) {
    return FeedbackModel(
      id: jsonValue['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
