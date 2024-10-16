enum MessageSenderType {
  user,
  club;
}

extension MessageSenderTypeExtension on MessageSenderType {
  int get value {
    switch (this) {
      case MessageSenderType.user:
        return 0;
      case MessageSenderType.club:
        return 1;
    }
  }
}
