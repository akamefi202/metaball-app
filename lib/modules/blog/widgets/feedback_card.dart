import 'package:flutter/material.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/modules/shared/models/feedback_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/box_shadow.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';
import 'package:metaball_app/utils/dates.dart';

class FeedbackCard extends StatefulWidget {
  const FeedbackCard({
    super.key,
    this.model,
  });

  final FeedbackModel? model;

  @override
  State<FeedbackCard> createState() => _FeedbackCardState();
}

class _FeedbackCardState extends State<FeedbackCard> {
  @override
  Widget build(BuildContext context) {
    final feedbackData = widget.model!;
    final authorData = widget.model!.author ?? UserModel(id: "default_user");

    return Container(
      width: MediaQuery.sizeOf(context).width - Spacing.generate(4),
      padding: EdgeInsets.all(Spacing.generate(1.5)),
      decoration: BoxDecoration(
        color: ThemeColors.primaryBackground,
        borderRadius:
            BorderRadius.circular(ThemeBorderRadius.componentBorderRaduis()),
        boxShadow: [ThemeBoxShadow.baseLight],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image(
                      width: 30.0,
                      height: 30.0,
                      image: AssetImage(authorData.avatar.isEmpty
                          ? Config.getDefaultAvatarUrl()
                          : authorData.avatar),
                    ),
                  ),
                  SizedBox(width: Spacing.generate(1)),
                  Text(
                    authorData.fullname,
                    style: const TextStyle(
                        fontSize: 10, color: ThemeColors.secondaryText),
                  )
                ],
              ),
              SizedBox(width: Spacing.generate(1)),
              Text(
                getBeforeDurationString(feedbackData.createdTime!),
                style: ThemeFonts.of(context).extraSmallTextSingle,
              ),
            ],
          ),
          SizedBox(height: Spacing.generate(2)),
          Text(feedbackData.content),
        ],
      ),
    );
  }
}
