import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';

class ThemeFontData {
  ThemeFontData({
    required this.heading1,
    required this.heading2,
    required this.heading3,
    required this.heading4,
    required this.heading5,
    required this.heading6,
    required this.buttonText,
    required this.navItemLabel,
    required this.tabItemLabel,
    required this.bigTextSingle,
    required this.commonTextSingle,
    required this.smallTextSingle,
    required this.extraSmallTextSingle,
  });

  final TextStyle heading1;
  final TextStyle heading2;
  final TextStyle heading3;
  final TextStyle heading4;
  final TextStyle heading5;
  final TextStyle heading6;

  final TextStyle buttonText;
  final TextStyle navItemLabel;
  final TextStyle tabItemLabel;

  final TextStyle bigTextSingle;
  final TextStyle commonTextSingle;
  final TextStyle smallTextSingle;
  final TextStyle extraSmallTextSingle;
}

class ThemeFonts {
  static ThemeFontData of(BuildContext context) {
    return ThemeFontData(
      heading1: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 28,
        height: 1,
        color: ThemeColors.primaryText,
      ),
      heading2: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 24,
        height: 1,
        color: ThemeColors.primaryText,
      ),
      heading3: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 20,
        height: 1,
        color: ThemeColors.primaryText,
      ),
      heading4: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: 1,
        color: ThemeColors.primaryText,
      ),
      heading5: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1,
        color: ThemeColors.primaryText,
      ),
      heading6: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1,
        color: ThemeColors.primaryText,
      ),
      buttonText: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1,
        letterSpacing: 2,
        color: ThemeColors.primaryText,
      ),
      tabItemLabel: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1,
        color: ThemeColors.primaryText,
      ),
      navItemLabel: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 9,
        height: 1,
        color: ThemeColors.primaryButton,
      ),
      bigTextSingle: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 18,
        height: 1.33,
        color: ThemeColors.primaryText,
      ),
      commonTextSingle: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 16,
        height: 1.33,
        color: ThemeColors.primaryText,
      ),
      smallTextSingle: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        height: 1.33,
        color: ThemeColors.primaryText,
      ),
      extraSmallTextSingle: const TextStyle(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.33,
        color: ThemeColors.primaryText,
      ),
    );
  }
}
