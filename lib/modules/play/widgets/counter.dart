import 'package:flutter/cupertino.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';

class Counter extends StatefulWidget {
  const Counter({
    super.key,
    this.value = 0,
    this.onIncreased,
    this.onDecreased,
  });

  final int value;
  final VoidCallback? onIncreased;
  final VoidCallback? onDecreased;

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      GestureDetector(
        onTap: widget.onDecreased,
        child: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            border: Border.all(color: ThemeColors.neutral300),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const Center(
            child: Icon(
              CupertinoIcons.minus,
              color: ThemeColors.neutral300,
              size: 20.0,
            ),
          ),
        ),
      ),
      const SizedBox(width: 15.0),
      Text("${widget.value}", style: ThemeFonts.of(context).smallTextSingle),
      const SizedBox(width: 15.0),
      GestureDetector(
        onTap: widget.onIncreased,
        child: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
            border: Border.all(color: ThemeColors.neutral300),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: const Center(
            child: Icon(
              CupertinoIcons.plus,
              color: ThemeColors.neutral300,
              size: 20.0,
            ),
          ),
        ),
      ),
    ]);
  }
}
