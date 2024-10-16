import 'package:metaball_app/modules/shared/enums/message_type.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';

class MessageModel {
  String id;
  UserModel? sender;
  String text;
  String image;
  DateTime? sentTime;
  MessageType type;

  MessageModel({
    required this.id,
    this.sender,
    this.text = '',
    this.image = '',
    this.sentTime,
    this.type = MessageType.sent,
  });

  static MessageModel fromJson(Map<String, dynamic> jsonValue) {
    return MessageModel(
      id: jsonValue['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
