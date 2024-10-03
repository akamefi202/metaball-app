enum MessageSender {
  user,
  club;
}

extension MessageSenderExtension on MessageSender {
  int get value {
    switch (this) {
      case MessageSender.user:
        return 0;
      case MessageSender.club:
        return 1;
    }
  }
}
