import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/spacing.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({
    super.key,
    this.onChanged,
    this.text = '',
    this.value = false,
  });

  final ValueChanged<bool>? onChanged;
  final String text;
  final bool value;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  Future<void> onPressed(value) async {
    if (widget.onChanged != null) {
      widget.onChanged!.call(value);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          widget.text,
          style:
              const TextStyle(fontSize: 15.0, color: ThemeColors.primaryButton),
        ),
        SizedBox(width: Spacing.generate(1)),
        Switch(
          inactiveTrackColor: ThemeColors.neutral600,
          activeTrackColor: ThemeColors.primaryButton,
          thumbColor: const WidgetStatePropertyAll(ThemeColors.neutral100),
          value: widget.value,
          onChanged: onPressed,
        ),
      ],
    );
  }
}
