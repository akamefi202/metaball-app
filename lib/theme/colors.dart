import 'dart:math';
import 'package:flutter/material.dart';

class ThemeColors {
  static const Color neutral100 = Color(0xFFFFFFFF);
  static const Color neutral200 = Color(0xFFF2F2F2);
  static const Color neutral300 = Color(0xFFA1A1A1);
  static const Color neutral600 = Color(0xFF8E8E8E);
  static const Color neutral700 = Color(0xFF707070);
  static const Color neutral800 = Color(0xFF353535);
  static const Color neutral900 = Color(0xFF000000);

  static const Color primary400 = Color(0xFFFE375D);
  static const Color primary500 = Color(0xFF26ADAD);

  static const Color secondary400 = Color(0xFF115DA9);
  static const Color secondary500 = Color(0xFF22507D);

  static const Color tertiary400 = Color(0xFFE6301E);
  static const Color tertiary500 = Color(0xFFB8372A);

  static const Color link = primary400;
  static const Color error = tertiary400;
  static const Color success = primary400;

  static const Color primaryText = neutral900;
  static const Color secondaryText = neutral700;

  static const Color primaryDarkText = neutral100;
  static const Color secondaryDarkText = neutral200;

  static const Color primaryButton = primary400;

  static const Color primaryBackground = neutral100;
  static const Color secondaryBackground = neutral200;

  static const Color primaryDarkBackground = neutral900;

  static const Color componentBorder = neutral600;
  static const Color separator = neutral200;

  static const LinearGradient primarySecondary90 = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [primary400, secondary400],
  );

  static Color tintColor(Color color, double factor) {
    return Color.fromRGBO(
      _tintValue(color.red, factor),
      _tintValue(color.green, factor),
      _tintValue(color.blue, factor),
      1,
    );
  }

  static Color shadeColor(Color color, double factor) {
    return Color.fromRGBO(
      _shadeValue(color.red, factor),
      _shadeValue(color.green, factor),
      _shadeValue(color.blue, factor),
      1,
    );
  }

  static int _tintValue(int value, double factor) {
    return max(0, min((value + ((255 - value) * factor)).round(), 255));
  }

  static int _shadeValue(int value, double factor) {
    return max(0, min(value - (value * factor).round(), 255));
  }
}
