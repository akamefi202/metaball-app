enum RoundHostType {
  personal,
  club;
}

extension RoundHostTypeExtension on RoundHostType {
  int get value {
    switch (this) {
      case RoundHostType.personal:
        return 0;
      case RoundHostType.club:
        return 1;
    }
  }
}
