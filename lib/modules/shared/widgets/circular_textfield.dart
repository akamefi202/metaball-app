import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class CircularTextField extends StatefulWidget {
  const CircularTextField({
    super.key,
    this.onChanged,
    this.placeholder = '',
    this.keyboardType = TextInputType.text,
    this.isSearch = false,
  });

  final ValueChanged<dynamic>? onChanged;
  final String placeholder;
  final TextInputType keyboardType;
  final bool isSearch;

  @override
  State<CircularTextField> createState() => _CircularTextFieldState();
}

class _CircularTextFieldState extends State<CircularTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        prefixIconConstraints: const BoxConstraints(minWidth: 50.0),
        prefixIcon: widget.isSearch ? const Icon(Icons.search) : null,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColors.componentBorder),
          borderRadius: BorderRadius.circular(20.0),
        ),
        hintStyle: ThemeFonts.of(context)
            .smallTextSingle
            .apply(color: ThemeColors.secondaryText),
        hintText: widget.placeholder,
        fillColor: ThemeColors.primaryBackground,
        contentPadding: EdgeInsets.symmetric(
          vertical: Spacing.generate(1),
          horizontal: Spacing.generate(2),
        ),
      ),
      style: ThemeFonts.of(context).smallTextSingle,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
    );
  }
}
