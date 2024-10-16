import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/blog/widgets/feedback_card.dart';
import 'package:metaball_app/modules/shared/models/feedback_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class FeedbackListScreen extends StatefulWidget {
  final String? blogId;

  const FeedbackListScreen({super.key, this.blogId});
  @override
  State<FeedbackListScreen> createState() => _FeedbackListScreenState();
}

class _FeedbackListScreenState extends State<FeedbackListScreen> {
  String _feedbackText = '';

  @override
  void initState() {
    super.initState();
  }

  Widget renderScreenSpacing() {
    return Column(
      children: [
        SizedBox(height: Spacing.generate(3)),
        const Separator(),
        SizedBox(height: Spacing.generate(3)),
      ],
    );
  }

  Widget renderFeedbacks(List<FeedbackModel> feedbackList) {
    List<Widget> feedbackWidgets = [];
    for (var feedback in feedbackList) {
      feedbackWidgets.add(FeedbackCard(model: feedback));
      feedbackWidgets.add(renderScreenSpacing());
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: feedbackWidgets,
    );
  }

  Widget renderFeedbackInput() {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            debugPrint("feedback list screen - picture button is pressed");
          },
          child: const Icon(
            Icons.image_outlined,
            size: 30.0,
          ),
        ),
        SizedBox(width: Spacing.generate(2)),
        Expanded(
          child: Container(
            height: 34.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              border: Border.all(color: ThemeColors.componentBorder),
            ),
            child: Row(
              children: [
                const SizedBox(width: 17.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintStyle: ThemeFonts.of(context)
                          .smallTextSingle
                          .apply(color: ThemeColors.secondaryText),
                      hintText: l10n.textInputPlaceholder,
                      fillColor: Colors.transparent,
                      contentPadding: const EdgeInsets.all(0),
                    ),
                    style: ThemeFonts.of(context).smallTextSingle,
                    onChanged: (value) {
                      setState(() {
                        debugPrint(
                            "feedback list screen - feedback text is inputed: $value");
                        _feedbackText = value;
                      });
                    },
                  ),
                ),
                SizedBox(width: Spacing.generate(1)),
                InkWell(
                  onTap: () {
                    debugPrint(
                        "feedback list screen - upload button is pressed");
                  },
                  child: const Icon(
                    CupertinoIcons.arrow_up_circle_fill,
                    size: 24.0,
                  ),
                ),
                const SizedBox(width: 4.0),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.appBarHeight,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, size: 25.0),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            CustomIconButton(
              icon: const Icon(Icons.favorite_outline,
                  color: ThemeColors.primaryText),
              onPressed: () {
                debugPrint("feedback list screen - follow button is pressed");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
            CustomIconButton(
              icon: SvgPicture.asset(
                "assets/images/upload.svg",
                width: Sizes.headerSvgIconSize,
                height: Sizes.headerSvgIconSize,
              ),
              onPressed: () {
                debugPrint("feedback list screen - upload button is pressed");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
          ],
        ),
        body: FutureBuilder(
          future: DummyService.getFeedbackListByBlogId(widget.blogId!),
          builder: (context, snapshot) {
            final feedbackList = snapshot.data ?? [];

            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: Spacing.pageVerticalSpacing(),
                horizontal: Spacing.pageHorizontalSpacing(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "${l10n.reviewLabel} ${feedbackList.length}${l10n.caseLabel}",
                    style: ThemeFonts.of(context).heading1,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: Spacing.generate(2)),
                  renderFeedbacks(feedbackList),
                  renderFeedbackInput(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
