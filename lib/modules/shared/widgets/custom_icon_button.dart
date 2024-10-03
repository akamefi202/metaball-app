import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';

class CustomIconButton extends StatefulWidget {
  const CustomIconButton({
    super.key,
    this.onPressed,
    this.icon,
  });

  final VoidCallback? onPressed;
  final Widget? icon;

  @override
  State<CustomIconButton> createState() => _CustomIconButtonState();
}

class _CustomIconButtonState extends State<CustomIconButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.all(0),
        shape: const CircleBorder(),
        minimumSize: const Size(40.0, 40.0),
        fixedSize: const Size(40.0, 40.0),
        backgroundColor: ThemeColors.secondaryBackground,
        shadowColor: Colors.transparent,
      ),
      child: Center(child: widget.icon),
    );
  }
}
