import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';
import 'package:metaball_app/utils/dates.dart';

class CustomDatePicker extends StatefulWidget {
  const CustomDatePicker({
    super.key,
    this.value,
    this.onPressed,
    this.selected = false,
  });

  final DateTime? value;
  final AsyncCallback? onPressed;
  final bool selected;

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.pageHorizontalSpacing(),
          vertical: Spacing.pageVerticalSpacing(),
        ),
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(BorderRadiusValue.componentBorderRaduis()),
          border: Border.all(color: ThemeColors.componentBorder),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selected
                  ? getStringFromStartDate(widget.value ?? DateTime.now())
                  : l10n.startDatePlaceholder,
              style: ThemeFonts.of(context)
                  .smallTextSingle
                  .apply(color: ThemeColors.secondaryText),
            ),
            const Icon(
              CupertinoIcons.chevron_down,
              color: ThemeColors.secondaryText,
              size: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
