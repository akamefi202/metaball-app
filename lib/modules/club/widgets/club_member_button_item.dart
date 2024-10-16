import 'package:flutter/material.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/spacing.dart';

// club_member_button_item adds or removes a member from the member list of the club
// it is used in club_settings_screen & club_member_list_screen

class ClubMemberButtonItem extends StatefulWidget {
  const ClubMemberButtonItem({
    super.key,
    this.icon,
    this.label = "",
    this.onPressed,
  });

  final Widget? icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  State<ClubMemberButtonItem> createState() => _ClubMemberButtonItemState();
}

class _ClubMemberButtonItemState extends State<ClubMemberButtonItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Column(children: [
        Container(
          width: 40.0,
          height: 40.0,
          decoration: BoxDecoration(
            color: ThemeColors.secondaryBackground,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Center(child: widget.icon ?? Container()),
        ),
        SizedBox(height: Spacing.extraSmallSpacing()),
        Text(
          widget.label,
          style: const TextStyle(fontSize: 10.0),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ]),
    );
  }
}
