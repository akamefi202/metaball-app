import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metaball_app/modules/play/enums/province.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';

class ProvinceCard extends StatefulWidget {
  const ProvinceCard({
    super.key,
    this.value = Province.japan,
    this.onPressed,
    this.selected = false,
  });

  final bool selected;
  final Province value;
  final VoidCallback? onPressed;

  @override
  State<ProvinceCard> createState() => _ProvinceCardState();
}

class _ProvinceCardState extends State<ProvinceCard> {
  String getImageUrl() {
    switch (widget.value) {
      case Province.japan:
        return 'assets/images/japan.svg';
      case Province.chubu:
        return 'assets/images/chubu.svg';
      case Province.chugoku:
        return 'assets/images/chugoku.svg';
      case Province.hokkaido:
        return 'assets/images/hokkaido.svg';
      case Province.kansai:
        return 'assets/images/kansai.svg';
      case Province.kanto:
        return 'assets/images/kanto.svg';
      case Province.kyushu:
        return 'assets/images/kyushu.svg';
      case Province.shikoku:
        return 'assets/images/shikoku.svg';
      case Province.tohoku:
        return 'assets/images/tohoku.svg';
      default:
        return 'assets/images/japan.svg';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.selected
                ? ThemeColors.neutral900
                : ThemeColors.neutral300,
            width: 2.0,
          ),
          borderRadius:
              BorderRadius.circular(BorderRadiusValue.componentBorderRaduis()),
        ),
        child: SvgPicture.asset(
          getImageUrl(),
          width: 90.0,
          height: 90.0,
        ),
      ),
    );
  }
}
