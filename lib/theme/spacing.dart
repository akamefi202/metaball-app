class Spacing {
  static const double _baseSpacing = 9.0;

  static double generate(double value) {
    return _baseSpacing * value;
  }

  static double pageHorizontalSpacing() {
    return Spacing.generate(2.0);
  }

  static double pageVerticalSpacing() {
    return 15.0;
  }

  static double extraSmallSpacing() {
    return 3.0;
  }
}
