import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/spacing.dart';

class ThemeSelection extends StatefulWidget {
  const ThemeSelection({
    super.key,
    this.themes,
    this.selectedThemes,
    this.onSelected,
    this.onDeselected,
  });

  final List<String>? themes;
  final List<String>? selectedThemes;
  final ValueChanged<String>? onSelected;
  final ValueChanged<String>? onDeselected;

  @override
  State<ThemeSelection> createState() => _ThemeSelectionState();
}

class _ThemeSelectionState extends State<ThemeSelection> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: Spacing.generate(1),
      spacing: Spacing.generate(1),
      children: (widget.themes ?? []).map((element) {
        final selected = (widget.selectedThemes ?? []).contains(element);

        return GestureDetector(
          onTap: () {
            if (selected) {
              widget.onDeselected!(element);
            } else {
              widget.onSelected!(element);
            }
          },
          child: Container(
            width:
                (MediaQuery.of(context).size.width - Spacing.generate(6)) / 3,
            height: 36.0,
            decoration: BoxDecoration(
              color: selected
                  ? ThemeColors.primaryDarkBackground
                  : ThemeColors.primaryBackground,
              borderRadius: BorderRadius.circular(18.0),
              border: Border.all(
                  color: selected
                      ? ThemeColors.neutral900
                      : ThemeColors.neutral700),
            ),
            child: Center(
              child: Text(
                element,
                style: TextStyle(
                  fontSize: 12,
                  color: selected
                      ? ThemeColors.primaryDarkText
                      : ThemeColors.primaryText,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
