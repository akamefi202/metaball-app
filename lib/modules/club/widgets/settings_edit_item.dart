import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class SettingsEditItem extends StatefulWidget {
  const SettingsEditItem({
    super.key,
    this.value = "",
    this.label = "",
    this.onPressed,
  });

  final String value;
  final String label;
  final VoidCallback? onPressed;

  @override
  State<SettingsEditItem> createState() => _SettingsEditItemState();
}

class _SettingsEditItemState extends State<SettingsEditItem> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        width: double.infinity,
        height: 80.0,
        padding: EdgeInsets.all(Spacing.extraSmallSpacing()),
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(color: ThemeColors.separator),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.label,
                    style: ThemeFonts.of(context).commonTextSingle),
                if (widget.value.isNotEmpty)
                  Text(
                    widget.value,
                    style: ThemeFonts.of(context)
                        .smallTextSingle
                        .apply(color: ThemeColors.secondaryText),
                  ),
              ],
            ),
            SizedBox(width: Spacing.generate(1)),
            Row(
              children: [
                Text(l10n.editButton,
                    style: ThemeFonts.of(context).commonTextSingle),
                SizedBox(width: Spacing.extraSmallSpacing()),
                const Icon(Icons.chevron_right, size: 20.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
