// the user sent or received a message from the another user
enum MessageType {
  sent,
  received,
}

extension MessageTypeExtension on MessageType {
  int get value {
    switch (this) {
      case MessageType.sent:
        return 0;
      case MessageType.received:
        return 1;
    }
  }
}
