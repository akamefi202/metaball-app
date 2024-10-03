enum RoundStatus {
  hosted,
  requested,
  invited,
  completed,
  followed;
}

extension RoundStatusExtension on RoundStatus {
  int get value {
    switch (this) {
      case RoundStatus.hosted:
        return 0;
      case RoundStatus.requested:
        return 1;
      case RoundStatus.invited:
        return 2;
      case RoundStatus.completed:
        return 3;
      case RoundStatus.followed:
        return 4;
    }
  }
}
