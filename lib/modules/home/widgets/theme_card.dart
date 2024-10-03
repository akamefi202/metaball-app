import 'dart:async';
import 'package:flutter/material.dart';
import 'package:metaball_app/modules/shared/models/ads_model.dart';
import 'package:metaball_app/theme/border_radius.dart';

class ThemeCard extends StatefulWidget {
  const ThemeCard({
    super.key,
    this.model,
  });

  final ThemeModel? model;

  @override
  State<ThemeCard> createState() => _ThemeCardState();
}

class _ThemeCardState extends State<ThemeCard> {
  Future<void> onPressed() async {
    debugPrint("theme card onPressed");
  }

  @override
  Widget build(BuildContext context) {
    final themeData = widget.model!;

    return Container(
      height: 260.0,
      decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(BorderRadiusValue.componentBorderRaduis())),
      child: Image(image: AssetImage(themeData.image)),
    );
  }
}
