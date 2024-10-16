import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/spacing.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({
    super.key,
    this.onChanged,
    this.value = '',
    this.placeholder = '',
    this.items,
  });

  final ValueChanged<String?>? onChanged;
  final String value;
  final String placeholder;
  final List<String>? items;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        // Add Horizontal padding using menuItemStyleData.padding so it matches
        // the menu padding when button's width is not specified.
        contentPadding:
            EdgeInsets.symmetric(vertical: Spacing.pageVerticalSpacing()),
        fillColor: ThemeColors.primaryBackground,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ThemeColors.componentBorder),
          borderRadius:
              BorderRadius.circular(ThemeBorderRadius.componentBorderRaduis()),
        ),
        // Add more decoration..
      ),
      hint: Text(
        widget.placeholder,
        style: const TextStyle(
          fontSize: 14,
          color: ThemeColors.neutral300,
        ),
      ),
      items: (widget.items ?? [])
          .map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ThemeColors.secondaryText,
                  ),
                ),
              ))
          .toList(),
      value: widget.value,
      onChanged: widget.onChanged,
      buttonStyleData: ButtonStyleData(
        padding: EdgeInsets.only(right: Spacing.generate(2)),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          CupertinoIcons.chevron_down,
          color: ThemeColors.secondaryText,
        ),
        iconSize: 20,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(ThemeBorderRadius.componentBorderRaduis()),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        height: 40,
      ),
    );
  }
}
