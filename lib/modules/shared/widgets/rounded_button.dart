import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class RoundedButton extends StatefulWidget {
  const RoundedButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.text = '',
    this.disabled = false,
    this.minWidth = 250.0,
    this.color = ThemeColors.primaryButton,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool disabled;
  final double minWidth;
  final Color color;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  Future<void> _onPressed() async {
    if (widget.onPressed != null) {
      widget.onPressed!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(ThemeBorderRadius.generate(1));

    return Opacity(
      opacity: widget.disabled ? 0.5 : 1,
      child: ElevatedButton(
        onPressed: widget.isLoading || widget.disabled ? null : _onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: Size(widget.minWidth, 0),
          padding: EdgeInsets.all(Spacing.generate(2)),
          backgroundColor: widget.color,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: widget.isLoading
            ? const CircularProgressIndicator()
            : Text(
                widget.text,
                style: ThemeFonts.of(context)
                    .buttonText
                    .apply(color: ThemeColors.primaryDarkText),
              ),
      ),
    );
  }
}
