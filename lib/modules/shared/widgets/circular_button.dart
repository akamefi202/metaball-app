import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/modules/shared/enums/circular_button_style.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class CircularButton extends StatefulWidget {
  const CircularButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.text = '',
    this.disabled = false,
    this.color = ThemeColors.primaryButton,
    this.buttonStyle = CircularButtonStyle.elevated,
    this.minimumSize,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool disabled;
  final Color color;
  final CircularButtonStyle buttonStyle;
  final Size? minimumSize;

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
          minimumSize: widget.minimumSize,
          side: BorderSide(
              color: widget.buttonStyle == CircularButtonStyle.elevated
                  ? Colors.transparent
                  : widget.color),
          padding: EdgeInsets.symmetric(horizontal: Spacing.generate(2)),
          backgroundColor: widget.buttonStyle == CircularButtonStyle.elevated
              ? widget.color
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
                  : widget.color),
        ),
      ),
    );
  }
}
