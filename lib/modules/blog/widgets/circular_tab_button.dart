import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class CircularTabButton extends StatefulWidget {
  const CircularTabButton({
    super.key,
    this.onPressed,
    this.isSelected = false,
    this.text = '',
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isSelected;

  @override
  State<CircularTabButton> createState() => _CircularTabButtonState();
}

class _CircularTabButtonState extends State<CircularTabButton> {
  Future<void> onPressed() async {
    if (widget.onPressed != null) {
      widget.onPressed!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: BorderSide(
            color: widget.isSelected
                ? ThemeColors.primaryDarkBackground
                : ThemeColors.componentBorder),
        padding: EdgeInsets.symmetric(horizontal: Spacing.generate(1)),
        backgroundColor: widget.isSelected
            ? ThemeColors.primaryDarkBackground
            : ThemeColors.primaryBackground,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: Text(
        widget.text,
        style: ThemeFonts.of(context).buttonText.apply(
            color: widget.isSelected
                ? ThemeColors.primaryDarkText
                : ThemeColors.primaryText),
      ),
    );
  }
}
