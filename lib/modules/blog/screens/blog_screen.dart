import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/blog/widgets/feedback_card.dart';
import 'package:metaball_app/modules/shared/models/blog_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/modules/shared/widgets/custom_outlined_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class BlogScreen extends StatefulWidget {
  final String? id;

  const BlogScreen({super.key, this.id});
  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget renderScreenSpacing() {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Spacing.pageHorizontalSpacing()),
      child: Column(
        children: [
          SizedBox(height: Spacing.generate(3)),
          const Separator(),
          SizedBox(height: Spacing.generate(3)),
        ],
      ),
    );
  }

  Widget renderTopicList(BlogModel blog) {
    List<String> topicList = blog.topicList;
    List<Widget> topics = [];

    for (var topic in topicList) {
      topics.add(Container(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.generate(1),
          vertical: Spacing.extraSmallSpacing(),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: ThemeColors.componentBorder),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Text(
          topic,
          style: ThemeFonts.of(context).extraSmallTextSingle,
        ),
      ));
      topics.add(SizedBox(width: Spacing.generate(1)));
    }

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Spacing.pageHorizontalSpacing()),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: topics),
      ),
    );
  }

  Widget renderAuthorInform(BlogModel blog) {
    final l10n = context.l10n;
    UserModel userData = blog.author ?? UserModel(id: "default_user");

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Spacing.pageHorizontalSpacing()),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${l10n.contributorLabel}: ${userData.fullname}",
                  style: ThemeFonts.of(context).commonTextSingle,
                ),
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
        ],
      ),
    );
  }

  Widget renderFeedbacks(BlogModel blog) {
    final l10n = context.l10n;
    final feedbackList = blog.feedbackList;

    List<Widget> feedbacks = [];
    for (var feedback in feedbackList) {
      feedbacks.add(FeedbackCard(model: feedback));

      if (feedback.id != feedbackList.last.id) {
        feedbacks.add(SizedBox(width: Spacing.generate(1.5)));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Spacing.pageHorizontalSpacing()),
          child: Text(
            "${l10n.reviewLabel} ${feedbackList.length}${l10n.caseLabel}",
            style: ThemeFonts.of(context).heading4,
            textAlign: TextAlign.left,
          ),
        ),
        SingleChildScrollView(
          padding: EdgeInsets.all(Spacing.generate(2)),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: feedbacks,
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Spacing.pageHorizontalSpacing()),
          child: CustomOutlinedButton(
            text: l10n.viewAllReviewButton,
            color: ThemeColors.primaryText,
            onPressed: () {
              debugPrint("blog screen - view all reviews button is pressed");
              context.push("${RouteKey.feedbackList.location}/${blog.id}");
            },
          ),
        ),
      ],
    );
  }

  Widget renderThumbnails(BlogModel blog) {
    List<Widget> widgets = [];
    for (var e in blog.thumbnailList) {
      widgets.add(Image(
        width: MediaQuery.sizeOf(context).width,
        height: 300.0,
        fit: BoxFit.cover,
        image: AssetImage(e),
      ));
    }

    return CarouselSlider(
      options: CarouselOptions(
        viewportFraction: 1.0,
        height: 300.0,
      ),
      items: widgets,
    );
  }

  Widget renderContent(BlogModel blog) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        renderThumbnails(blog),
        SizedBox(height: Spacing.generate(2)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Spacing.pageHorizontalSpacing()),
          child: Text(
            blog.title,
            style: ThemeFonts.of(context).heading1,
          ),
        ),
        SizedBox(height: Spacing.generate(2)),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Spacing.pageHorizontalSpacing()),
          child: Container(
            padding: EdgeInsets.all(Spacing.generate(1.5)),
            decoration: BoxDecoration(
              color: ThemeColors.secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Text(
              blog.content,
              style: ThemeFonts.of(context).smallTextSingle,
            ),
          ),
        ),
        SizedBox(height: Spacing.generate(3)),
        renderTopicList(blog),
        renderScreenSpacing(),
        renderAuthorInform(blog),
        renderScreenSpacing(),
        renderFeedbacks(blog),
        SizedBox(height: Spacing.generate(3)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: Sizes.appBarHeight,
          leadingWidth: 58.0,
          leading: Padding(
            padding: EdgeInsets.only(left: Spacing.generate(2)),
            child: CustomIconButton(
              icon: const Icon(Icons.chevron_left,
                  color: ThemeColors.primaryText),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          backgroundColor: Colors.transparent,
          actions: [
            CustomIconButton(
              icon: const Icon(Icons.favorite_outline,
                  color: ThemeColors.primaryText),
              onPressed: () {
                debugPrint("blog screen - follow button is pressed");
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
                debugPrint("blog screen - upload button is pressed");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
          ],
        ),
        body: FutureBuilder(
          future: DummyService.getBlogById(widget.id!),
          builder: (context, snapshot) {
            final result = snapshot.data != null
                ? snapshot.data as BlogModel
                : BlogModel(id: 'default_id');

            return SingleChildScrollView(
              child: Column(
                children: [
                  renderContent(result),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
