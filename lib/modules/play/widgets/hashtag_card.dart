import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/modules/shared/models/ads_model.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class HashtagCard extends StatefulWidget {
  const HashtagCard({
    super.key,
    this.model,
  });

  final ThemeModel? model;

  @override
  State<HashtagCard> createState() => _HashtagCardState();
}

class _HashtagCardState extends State<HashtagCard> {
  Future<void> onPressed() async {
    debugPrint("hashtag card is pressed");
  }

  @override
  Widget build(BuildContext context) {
    final themeData = widget.model!;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: ThemeColors.separator),
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: Spacing.pageVerticalSpacing()),
        child: Text(
          "#  ${themeData.text}",
          style: ThemeFonts.of(context)
              .heading3
              .apply(color: ThemeColors.primaryButton),
        ),
      ),
    );
  }
}
