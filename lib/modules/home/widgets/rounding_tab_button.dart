import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';

class RoundingTabButton extends StatefulWidget {
  const RoundingTabButton({
    super.key,
    this.onPressed,
    this.text = '',
    this.icon,
    this.underlined = false,
  });

  final VoidCallback? onPressed;
  final String text;
  final IconData? icon;
  final bool underlined;

  @override
  State<RoundingTabButton> createState() => _RoundingTabButtonState();
}

class _RoundingTabButtonState extends State<RoundingTabButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(0),
        minimumSize: const Size(0, 0),
        fixedSize: const Size(70.0, 70.0),
        shape: const BeveledRectangleBorder(),
        backgroundColor: ThemeColors.primaryBackground,
        shadowColor: Colors.transparent,
        disabledBackgroundColor: ThemeColors.primaryBackground,
      ),
      child: Container(
        width: 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          border: Border(
            bottom: widget.underlined
                ? const BorderSide(width: 1.5, color: Colors.black)
                : BorderSide.none,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(widget.icon, color: Colors.black),
            const SizedBox(height: 5.0),
            Text(widget.text, style: ThemeFonts.of(context).tabItemLabel),
          ],
        ),
      ),
    );
  }
}
