import 'package:metaball_app/modules/shared/models/feedback_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';

class BlogModel {
  String id;
  String image;
  String topic;
  String title;
  String content;
  UserModel? author;
  List<String> topicList;
  List<String> thumbnailList;
  List<FeedbackModel> feedbackList;

  BlogModel({
    required this.id,
    this.image = '',
    this.topic = '',
    this.title = '',
    this.content = '',
    this.author,
    this.topicList = const [],
    this.thumbnailList = const [],
    this.feedbackList = const [],
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
