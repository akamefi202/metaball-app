import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class ClubItem extends StatefulWidget {
  const ClubItem({
    super.key,
    required this.model,
  });

  final ClubModel model;

  @override
  State<ClubItem> createState() => _ClubItemState();
}

class _ClubItemState extends State<ClubItem> {
  Future<void> onPressed() async {
    debugPrint("club item is pressed");
    context.push('${RouteKey.club.location}/${widget.model.id}');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final clubData = widget.model;

    return Padding(
      padding: EdgeInsets.all(Spacing.extraSmallSpacing()),
      child: Row(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: Image(
            width: 40.0,
            height: 40.0,
            image: AssetImage(clubData.logo.isEmpty
                ? Config.getDefaultLogoUrl()
                : clubData.logo),
          ),
        ),
        SizedBox(width: Spacing.generate(1.5)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                clubData.name,
                style: ThemeFonts.of(context).heading4,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 6.0),
              Text(
                "${clubData.memberCount}${l10n.personLabel}",
                style: const TextStyle(
                    color: ThemeColors.neutral600, fontSize: 12.0),
                maxLines: 1,
              ),
            ],
          ),
        ),
        SizedBox(width: Spacing.generate(1.5)),
        Column(children: [
          InkWell(
            onTap: onPressed,
            child: Container(
              width: 80.0,
              height: 26.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13.0),
                color: ThemeColors.secondaryBackground,
              ),
              child: Center(
                child: Text(
                  l10n.viewMoreButton,
                  style: const TextStyle(fontSize: 12.0),
                ),
              ),
            ),
          ),
          const SizedBox(height: 3.0),
          Text(
            l10n.membershipOnlyLabel,
            style: const TextStyle(
                fontSize: 9.0, color: ThemeColors.secondaryText),
          ),
        ]),
      ]),
    );
  }
}
