import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/modules/shared/enums/circular_button_style.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/spacing.dart';

class SmallCircularButton extends StatefulWidget {
  const SmallCircularButton({
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
  State<SmallCircularButton> createState() => _SmallCircularButtonState();
}

class _SmallCircularButtonState extends State<SmallCircularButton> {
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
          minimumSize: const Size(0, 0),
          side: BorderSide(
              color: widget.buttonStyle == CircularButtonStyle.elevated
                  ? Colors.transparent
                  : widget.fillColor),
          padding: EdgeInsets.symmetric(
            vertical: Spacing.generate(1),
            horizontal: Spacing.generate(2),
          ),
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
          style: TextStyle(
            fontSize: 10.0,
            color: widget.buttonStyle == CircularButtonStyle.elevated
                ? ThemeColors.primaryDarkText
                : widget.fillColor,
          ),
        ),
      ),
    );
  }
}
