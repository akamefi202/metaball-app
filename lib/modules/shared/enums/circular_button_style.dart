enum CircularButtonStyle {
  elevated,
  outlined,
}

extension CircularButtonStyleExtension on CircularButtonStyle {
  int get value {
    switch (this) {
      case CircularButtonStyle.elevated:
        return 0;
      case CircularButtonStyle.outlined:
        return 1;
    }
  }
}
