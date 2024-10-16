import 'package:flutter/material.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/theme/spacing.dart';

// club_member_item represents the member's name & avatar
// it is used in club_settings_screen & club_member_list_screen

class ClubMemberItem extends StatelessWidget {
  const ClubMemberItem({
    super.key,
    required this.model,
  });

  final UserModel model;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image(
          width: 40.0,
          height: 40.0,
          image: AssetImage(model.avatar.isEmpty
              ? Config.getDefaultAvatarUrl()
              : model.avatar),
        ),
      ),
      SizedBox(height: Spacing.extraSmallSpacing()),
      Text(
        model.fullname,
        style: const TextStyle(fontSize: 10.0),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    ]);
  }
}
