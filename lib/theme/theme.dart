import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';

class CustomTheme {
  static ThemeData of(BuildContext context) {
    return ThemeData(
      fontFamily: 'Hiragino Sans GB',
      scaffoldBackgroundColor: ThemeColors.primaryBackground,
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        isDense: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.only(
          left: 15,
          right: 15,
          top: 12,
          bottom: 9,
        ),
      ),
    );
  }
}
