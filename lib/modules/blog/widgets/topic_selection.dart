import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/spacing.dart';

class TopicSelection extends StatefulWidget {
  const TopicSelection({
    super.key,
    this.options,
    this.selectedOption = '',
    this.onSelected,
  });

  final List<String>? options;
  final String selectedOption;
  final ValueChanged<String>? onSelected;

  @override
  State<TopicSelection> createState() => _ThemeSelectionState();
}

class _ThemeSelectionState extends State<TopicSelection> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: Spacing.generate(1),
      spacing: Spacing.generate(1),
      children: (widget.options ?? []).map((element) {
        final selected = widget.selectedOption == element;

        return GestureDetector(
          onTap: () {
            widget.onSelected!(element);
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
