import 'package:metaball_app/modules/message/enums/message_sender_type.dart';

class MessageSenderModel {
  String id;
  String lastMessage;
  DateTime? lastTime;
  String senderAvatar;
  String senderName;
  MessageSenderType senderType;

  MessageSenderModel({
    required this.id,
    this.lastMessage = '',
    this.lastTime,
    this.senderAvatar = '',
    this.senderName = '',
    this.senderType = MessageSenderType.user,
  });

  static MessageSenderModel fromJson(Map<String, dynamic> jsonValue) {
    return MessageSenderModel(
      id: jsonValue['id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
    };
  }
}
