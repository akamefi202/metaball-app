import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';

class Separator extends StatelessWidget {
  const Separator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 1,
      color: ThemeColors.separator,
    );
  }
}
