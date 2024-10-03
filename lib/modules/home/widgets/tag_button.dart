import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';

class TagButton extends StatefulWidget {
  const TagButton({
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
  State<TagButton> createState() => _TagButtonState();
}

class _TagButtonState extends State<TagButton> {
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
    return Opacity(
      opacity: widget.disabled ? 0.5 : 1,
      child: ElevatedButton(
        onPressed: isLoading || widget.disabled ? null : _onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(70.0, 24.0),
          minimumSize: const Size(0, 0),
          backgroundColor: ThemeColors.secondaryBackground,
          shadowColor: Colors.transparent,
          padding: const EdgeInsets.all(0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
        child: isLoading
            ? const CircularProgressIndicator()
            : Text(
                widget.text!,
                style: const TextStyle(
                    fontSize: 12.0, color: ThemeColors.primaryText),
              ),
      ),
    );
  }
}
