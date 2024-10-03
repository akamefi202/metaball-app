import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class CustomOutlinedButton extends StatefulWidget {
  const CustomOutlinedButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.text = '',
    this.disabled = false,
  });

  final VoidCallback? onPressed;

  final String text;

  final bool isLoading;
  final bool disabled;

  @override
  State<CustomOutlinedButton> createState() => _CustomOutlinedButtonState();
}

class _CustomOutlinedButtonState extends State<CustomOutlinedButton> {
  Future<void> onPressed() async {
    if (widget.onPressed != null) {
      widget.onPressed!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(BorderRadiusValue.generate(1));

    return Opacity(
      opacity: widget.disabled ? 0.5 : 1,
      child: OutlinedButton(
        onPressed: widget.isLoading || widget.disabled ? null : onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size(250.0, 0),
          padding: EdgeInsets.all(Spacing.generate(2)),
          backgroundColor: ThemeColors.primaryBackground,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: widget.isLoading
            ? const CircularProgressIndicator()
            : Text(
                widget.text,
                style: ThemeFonts.of(context).buttonText,
              ),
      ),
    );
  }
}
