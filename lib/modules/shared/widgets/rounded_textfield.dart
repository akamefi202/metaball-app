import 'package:flutter/material.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class RoundedTextField extends StatefulWidget {
  const RoundedTextField({
    super.key,
    this.onChanged,
    this.placeholder = '',
    this.keyboardType = TextInputType.text,
  });

  final ValueChanged<dynamic>? onChanged;
  final String placeholder;
  final TextInputType keyboardType;

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColors.componentBorder),
          borderRadius:
              BorderRadius.circular(BorderRadiusValue.componentBorderRaduis()),
        ),
        hintStyle: ThemeFonts.of(context)
            .smallTextSingle
            .apply(color: ThemeColors.secondaryText),
        hintText: widget.placeholder,
        fillColor: ThemeColors.primaryBackground,
        contentPadding: EdgeInsets.symmetric(
          vertical: Spacing.pageVerticalSpacing(),
          horizontal: Spacing.generate(2),
        ),
      ),
      style: ThemeFonts.of(context).smallTextSingle,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
    );
  }
}
