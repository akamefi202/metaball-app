import 'package:flutter/material.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/modules/shared/widgets/small_circular_button.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class ClubMemberRecruitItem extends StatelessWidget {
  const ClubMemberRecruitItem({
    super.key,
    required this.model,
  });

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    final userData = model;
    final l10n = context.l10n;

    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom:
              BorderSide(width: 1.0, color: Color.fromRGBO(221, 221, 221, 1)),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: Spacing.generate(1),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(24.0),
            child: Image(
              width: 48.0,
              height: 48.0,
              image: AssetImage(userData.avatar.isEmpty
                  ? Config.getDefaultAvatarUrl()
                  : userData.avatar),
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(userData.fullname,
                    style: ThemeFonts.of(context).commonTextSingle),
                SizedBox(height: Spacing.extraSmallSpacing()),
                Text(
                  "${l10n.averageScoreLabel} ${userData.averageScore} | ${l10n.experienceLabel} ${userData.experience}${l10n.yearLabel}",
                  style: ThemeFonts.of(context)
                      .extraSmallTextSingle
                      .apply(color: ThemeColors.secondaryText),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12.0),
          SmallCircularButton(
            text: l10n.inviteLabel,
            onPressed: () {
              debugPrint("club member recruit item is pressed");
            },
          )
        ],
      ),
    );
  }
}
