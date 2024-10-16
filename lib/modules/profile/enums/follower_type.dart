enum FollowerType {
  followed,
  following,
}

extension FollowerTypeExtension on FollowerType {
  int get value {
    switch (this) {
      case FollowerType.followed:
        return 0;
      case FollowerType.following:
        return 1;
    }
  }
}
