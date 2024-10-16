import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/box_shadow.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class ClubCard extends StatefulWidget {
  const ClubCard({
    super.key,
    this.model,
    this.isStatic = false,
  });

  final ClubModel? model;
  final bool isStatic;

  @override
  State<ClubCard> createState() => _ClubCardState();
}

class _ClubCardState extends State<ClubCard> {
  Future<void> onPressed() async {
    debugPrint("club card is pressed");
    context.push("${RouteKey.club.location}/${widget.model!.id}");
  }

  @override
  Widget build(BuildContext context) {
    final clubData = widget.model!;
    final l10n = context.l10n;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(ThemeBorderRadius.componentBorderRaduis()),
        ),
        onTap: widget.isStatic ? null : onPressed,
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(Spacing.generate(3)),
          decoration: BoxDecoration(
            color: ThemeColors.primaryBackground,
            borderRadius: BorderRadius.circular(
                ThemeBorderRadius.componentBorderRaduis()),
            boxShadow: [ThemeBoxShadow.baseLight],
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image(
                  width: 100.0,
                  height: 100.0,
                  image: AssetImage(clubData.logo.isEmpty
                      ? Config.getDefaultLogoUrl()
                      : clubData.logo),
                ),
              ),
              SizedBox(height: Spacing.generate(1.5)),
              Text(clubData.name, style: ThemeFonts.of(context).heading2),
              SizedBox(height: Spacing.generate(1)),
              Text(
                "${clubData.memberCount}${l10n.personLabel}",
                style: ThemeFonts.of(context)
                    .smallTextSingle
                    .apply(color: ThemeColors.neutral600),
              )
            ],
          ),
        ),
      ),
    );
  }
}
