import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/shared/widgets/switch_button.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class SettingsSwitchItem extends StatefulWidget {
  const SettingsSwitchItem({
    super.key,
    this.value = false,
    this.label = "",
    this.onChanged,
  });

  final bool value;
  final String label;
  final ValueChanged<dynamic>? onChanged;

  @override
  State<SettingsSwitchItem> createState() => _SettingsSwitchItemState();
}

class _SettingsSwitchItemState extends State<SettingsSwitchItem> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Container(
      width: double.infinity,
      height: 80.0,
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
              Text(
                widget.value ? l10n.turnedOnLabel : l10n.turnedOffLabel,
                style: ThemeFonts.of(context)
                    .smallTextSingle
                    .apply(color: ThemeColors.secondaryText),
              ),
            ],
          ),
          SizedBox(width: Spacing.generate(1)),
          SwitchButton(
            value: widget.value,
            onChanged: widget.onChanged,
          ),
        ],
      ),
    );
  }
}
