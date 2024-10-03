import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';

class ThemeBoxShadow {
  static Color light = ThemeColors.neutral900.withOpacity(0.12);
  static Color dark = ThemeColors.neutral900.withOpacity(0.3);

  static BoxShadow baseLight = BoxShadow(
    color: dark,
    blurRadius: 8,
    offset: const Offset(0, 4),
  );

  static BoxShadow smallDark = BoxShadow(
    color: dark,
    blurRadius: 4,
    offset: const Offset(0, 2),
  );

  static BoxShadow navbar = BoxShadow(
    color: light,
    blurRadius: 16,
    offset: const Offset(0, -4),
  );
}
