import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/modules/shared/widgets/circular_button.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class RequesterCard extends StatefulWidget {
  const RequesterCard({
    super.key,
    this.model,
  });

  final UserModel? model;

  @override
  State<RequesterCard> createState() => _RequesterCardState();
}

class _RequesterCardState extends State<RequesterCard> {
  Future<void> onPressed() async {
    debugPrint("requester card is pressed");
    context.push('${RouteKey.member.location}/${widget.model!.id}');
  }

  @override
  Widget build(BuildContext context) {
    final userData = widget.model!;
    final l10n = context.l10n;

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 1.0, color: ThemeColors.separator),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: onPressed,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Spacing.generate(1),
                  horizontal: Spacing.extraSmallSpacing(),
                ),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Image(
                          width: 48.0,
                          height: 48.0,
                          image: AssetImage(userData.avatar.isEmpty
                              ? Config.getDefaultAvatar()
                              : userData.avatar)),
                    ),
                    SizedBox(width: Spacing.generate(1.5)),
                    Text(userData.fullname,
                        style: ThemeFonts.of(context).commonTextSingle),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                CircularButton(
                  text: l10n.rejectButton,
                  buttonStyle: CircularButtonStyle.outlined,
                  onPressed: () {
                    debugPrint("request reject button is pressed");
                  },
                ),
                SizedBox(width: Spacing.generate(1.5)),
                CircularButton(
                  text: l10n.acceptButton,
                  onPressed: () {
                    debugPrint("request accept button is pressed");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
