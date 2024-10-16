import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/box_shadow.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class RoundFilterTextfield extends StatefulWidget {
  const RoundFilterTextfield({
    super.key,
    this.region = '',
    this.theme = '',
    this.restriction = '',
  });

  final String region;
  final String theme;
  final String restriction;

  @override
  State<RoundFilterTextfield> createState() => _RoundFilterTextfieldState();
}

class _RoundFilterTextfieldState extends State<RoundFilterTextfield> {
  Future<void> onPressed() async {
    debugPrint("round filter textfield is pressed");
    context.push(RouteKey.roundListFilter.location);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(23.0),
      ),
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: 46.0,
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.generate(2),
          vertical: Spacing.extraSmallSpacing(),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          boxShadow: [ThemeBoxShadow.baseLight],
          color: ThemeColors.primaryBackground,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.region,
                      style: ThemeFonts.of(context).smallTextSingle,
                    ),
                    Text(
                      widget.theme,
                      style: const TextStyle(
                          fontSize: 10.0, color: ThemeColors.secondaryText),
                    ),
                  ],
                ),
                SizedBox(width: Spacing.generate(1)),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    widget.restriction,
                    style: const TextStyle(fontSize: 10.0),
                  ),
                )
              ],
            ),
            const Icon(Icons.edit_outlined, size: 20.0),
          ],
        ),
      ),
    );
  }
}
