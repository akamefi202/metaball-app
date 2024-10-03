import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

enum CircularButtonStyle {
  elevated,
  outlined,
}

class CircularButton extends StatefulWidget {
  const CircularButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.text = '',
    this.disabled = false,
    this.fillColor = ThemeColors.primaryButton,
    this.buttonStyle = CircularButtonStyle.elevated,
  });

  final VoidCallback? onPressed;

  final String text;

  final bool isLoading;
  final bool disabled;

  final Color fillColor;
  final CircularButtonStyle buttonStyle;

  @override
  State<CircularButton> createState() => _CircularButtonState();
}

class _CircularButtonState extends State<CircularButton> {
  Future<void> onPressed() async {
    if (widget.onPressed != null) {
      widget.onPressed!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: widget.disabled ? 0.5 : 1,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
              color: widget.buttonStyle == CircularButtonStyle.elevated
                  ? Colors.transparent
                  : ThemeColors.primaryButton),
          padding: EdgeInsets.symmetric(horizontal: Spacing.generate(2)),
          backgroundColor: widget.buttonStyle == CircularButtonStyle.elevated
              ? widget.fillColor
              : ThemeColors.neutral100,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        child: Text(
          widget.text,
          style: ThemeFonts.of(context).buttonText.apply(
              color: widget.buttonStyle == CircularButtonStyle.elevated
                  ? ThemeColors.primaryDarkText
                  : ThemeColors.primaryButton),
        ),
      ),
    );
  }
}
