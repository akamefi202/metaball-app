import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class SocialSigninButton extends StatefulWidget {
  const SocialSigninButton({
    super.key,
    this.onPressed,
    this.isLoading = false,
    this.text = '',
    this.icon,
  });

  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final Widget? icon;

  @override
  State<SocialSigninButton> createState() => _SocialSigninButtonState();
}

class _SocialSigninButtonState extends State<SocialSigninButton> {
  Future<void> onPressed() async {
    if (widget.onPressed != null) {
      widget.onPressed!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(ThemeBorderRadius.generate(1));

    return OutlinedButton(
      onPressed: widget.isLoading ? null : onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: ThemeColors.componentBorder),
        padding: EdgeInsets.all(Spacing.generate(2)),
        backgroundColor: ThemeColors.primaryBackground,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
      ),
      child: widget.isLoading
          ? const CircularProgressIndicator()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 18.0,
                  height: 18.0,
                  child: Center(child: widget.icon ?? Container()),
                ),
                Text(
                  widget.text,
                  style: ThemeFonts.of(context)
                      .buttonText
                      .apply(color: ThemeColors.secondaryText),
                ),
                const SizedBox(width: 18.0, height: 18.0)
              ],
            ),
    );
  }
}
