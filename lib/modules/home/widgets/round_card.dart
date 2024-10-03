import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:metaball_app/modules/shared/models/round_model.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';
import 'package:metaball_app/utils/dates.dart';

class RoundCard extends StatefulWidget {
  const RoundCard({
    super.key,
    this.model,
  });

  final RoundModel? model;

  @override
  State<RoundCard> createState() => _RoundCardState();
}

class _RoundCardState extends State<RoundCard> {
  Future<void> onPressed() async {
    debugPrint("round card is pressed");
    context.push('${RouteKey.roundRequesterList.location}/${widget.model!.id}');
  }

  @override
  Widget build(BuildContext context) {
    final roundData = widget.model!;
    final formatter = NumberFormat.decimalPattern();

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(width: 1.0, color: ThemeColors.separator),
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: Spacing.generate(1.5),
            horizontal: Spacing.extraSmallSpacing(),
          ),
          child: Row(children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          BorderRadiusValue.componentBorderRaduis())),
                  child: Image(
                    width: 32,
                    height: 32,
                    image: AssetImage(roundData.logo),
                  ),
                ),
                const SizedBox(height: 3.0),
                Text(roundData.ownerName,
                    style: const TextStyle(fontSize: 6.0)),
              ],
            ),
            SizedBox(width: Spacing.generate(2)),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roundData.title,
                    style: ThemeFonts.of(context).heading4,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    getStringFromStartDateTime(
                        roundData.startTime ?? DateTime.now()),
                    style: const TextStyle(
                        color: ThemeColors.neutral600, fontSize: 12.0),
                    maxLines: 1,
                  ),
                ],
              ),
            ),
            SizedBox(width: Spacing.generate(1)),
            Column(children: [
              Container(
                width: 60.0,
                height: 26.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: ThemeColors.secondaryBackground,
                ),
                child: Center(
                    child: Text(
                  "${roundData.memberCount}/${roundData.maxMemberCount}",
                  style: const TextStyle(
                      fontSize: 12.0, color: ThemeColors.neutral800),
                )),
              ),
              const SizedBox(height: 3.0),
              Text(
                "¥${formatter.format(roundData.cost)}",
                style: const TextStyle(
                    fontSize: 9.0, color: ThemeColors.neutral800),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
