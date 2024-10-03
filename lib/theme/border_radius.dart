class BorderRadiusValue {
  static const double _baseRadius = 8;

  static double generate(double value) {
    return _baseRadius * value;
  }

  static double componentBorderRaduis() {
    return 15.0;
  }
}
