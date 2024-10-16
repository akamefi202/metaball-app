import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class CustomMenuItem extends StatefulWidget {
  const CustomMenuItem({
    super.key,
    this.text = '',
    this.onPressed,
    this.icon = '',
  });

  final String text;
  final VoidCallback? onPressed;
  final String icon;

  @override
  State<CustomMenuItem> createState() => _CustomMenuItemState();
}

class _CustomMenuItemState extends State<CustomMenuItem> {
  @override
  Widget build(BuildContext context) {
    Future<void> onPressed() async {
      if (widget.onPressed != null) {
        widget.onPressed!.call();
      }
    }

    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: Color(0xFFDDDDDD)),
          ),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Spacing.generate(1.5),
          horizontal: Spacing.extraSmallSpacing(),
        ),
        child: Row(children: [
          SizedBox(
            width: Sizes.svgIconSize,
            height: Sizes.svgIconSize,
            child: Center(
              child: SvgPicture.asset(widget.icon),
            ),
          ),
          SizedBox(width: Spacing.generate(1)),
          Expanded(
              child: Text(widget.text,
                  style: ThemeFonts.of(context).commonTextSingle)),
          SizedBox(width: Spacing.generate(1)),
          const Icon(Icons.chevron_right),
        ]),
      ),
    );
  }
}
