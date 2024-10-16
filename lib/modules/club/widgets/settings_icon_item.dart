import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class SettingsIconItem extends StatefulWidget {
  const SettingsIconItem({
    super.key,
    this.label = "",
    this.onPressed,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  State<SettingsIconItem> createState() => _SettingsIconItemState();
}

class _SettingsIconItemState extends State<SettingsIconItem> {
  @override
  Widget build(BuildContext context) {
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
            Text(widget.label, style: ThemeFonts.of(context).commonTextSingle),
            SizedBox(width: Spacing.generate(1)),
            widget.icon ?? Container(),
          ],
        ),
      ),
    );
  }
}
