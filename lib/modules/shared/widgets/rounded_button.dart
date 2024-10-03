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
    this.isLoading,
    this.text,
    this.disabled = false,
  });

  final VoidCallback? onPressed;

  final String? text;

  final bool? isLoading;
  final bool disabled;

  @override
  State<RoundedButton> createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _isLoading = false;

  bool get isLoading {
    return (widget.isLoading ?? false) || _isLoading;
  }

  Future<void> _onPressed() async {
    if (widget.onPressed != null) {
      widget.onPressed!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(BorderRadiusValue.generate(1));

    return Opacity(
      opacity: widget.disabled ? 0.5 : 1,
      child: ElevatedButton(
        onPressed: isLoading || widget.disabled ? null : _onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(250.0, 0),
          padding: EdgeInsets.all(Spacing.generate(2)),
          backgroundColor: ThemeColors.primaryButton,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                widget.text!,
                style: ThemeFonts.of(context)
                    .buttonText
                    .apply(color: ThemeColors.primaryDarkText),
              ),
      ),
    );
  }
}
