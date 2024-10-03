import 'package:flutter/material.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class RoundedTextArea extends StatefulWidget {
  const RoundedTextArea({
    super.key,
    this.onChanged,
    this.placeholder = '',
  });

  final ValueChanged<String>? onChanged;
  final String placeholder;

  @override
  State<RoundedTextArea> createState() => _RoundedTextAreaState();
}

class _RoundedTextAreaState extends State<RoundedTextArea> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius:
              BorderRadius.circular(BorderRadiusValue.componentBorderRaduis()),
        ),
        hintStyle: ThemeFonts.of(context)
            .smallTextSingle
            .apply(color: ThemeColors.secondaryText),
        hintText: widget.placeholder,
        fillColor: ThemeColors.secondaryBackground,
        contentPadding: EdgeInsets.symmetric(
          vertical: Spacing.pageVerticalSpacing(),
          horizontal: Spacing.generate(2),
        ),
      ),
      style: ThemeFonts.of(context).smallTextSingle,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      onChanged: widget.onChanged,
    );
  }
}
