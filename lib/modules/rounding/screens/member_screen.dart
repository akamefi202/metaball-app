import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/home/widgets/blog_card.dart';
import 'package:metaball_app/modules/shared/models/blog_model.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/box_shadow.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class MemberScreen extends StatefulWidget {
  final String? id;

  const MemberScreen({super.key, this.id});
  @override
  State<MemberScreen> createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget renderUserInform(UserModel user) {
    final l10n = context.l10n;

    List<Widget> clubWidgets = [];
    for (ClubModel e in user.clubList) {
      clubWidgets.add(
        Text(
          e.name,
          style: ThemeFonts.of(context)
              .commonTextSingle
              .apply(color: ThemeColors.primaryButton),
        ),
      );

      if (e.id != user.clubList.last.id) {
        clubWidgets.add(SizedBox(width: Spacing.generate(1)));
        clubWidgets.add(Container(
            width: 1.0, height: 10.0, color: ThemeColors.primaryButton));
        clubWidgets.add(SizedBox(width: Spacing.generate(1)));
      }
    }

    return Column(children: [
      Container(
        padding: EdgeInsets.symmetric(
          horizontal: Spacing.generate(2),
          vertical: Spacing.generate(3),
        ),
        decoration: BoxDecoration(
          color: ThemeColors.primaryBackground,
          boxShadow: [ThemeBoxShadow.baseLight],
          borderRadius:
              BorderRadius.circular(ThemeBorderRadius.componentBorderRaduis()),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50.0),
                    child: Image(
                      width: 100.0,
                      height: 100.0,
                      image: AssetImage(user.avatar == ''
                          ? Config.getDefaultAvatarUrl()
                          : user.avatar),
                    ),
                  ),
                  SizedBox(height: Spacing.generate(1.5)),
                  Text(user.fullname, style: ThemeFonts.of(context).heading2),
                  SizedBox(height: Spacing.generate(1.0)),
                  Text("${user.age}歳",
                      style: ThemeFonts.of(context).smallTextSingle),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.averageScoreLabel,
                    style: ThemeFonts.of(context).extraSmallTextSingle,
                  ),
                  SizedBox(height: Spacing.extraSmallSpacing()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${user.averageScore}",
                        style: ThemeFonts.of(context).heading3,
                      ),
                      SizedBox(width: Spacing.extraSmallSpacing()),
                      Text(
                        l10n.pointLabel,
                        style: ThemeFonts.of(context).extraSmallTextSingle,
                      ),
                    ],
                  ),
                  SizedBox(height: Spacing.generate(1)),
                  const Separator(),
                  SizedBox(height: Spacing.generate(1)),
                  Text(
                    l10n.experienceLabel,
                    style: ThemeFonts.of(context).extraSmallTextSingle,
                  ),
                  SizedBox(height: Spacing.extraSmallSpacing()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${user.experience}",
                        style: ThemeFonts.of(context).heading3,
                      ),
                      SizedBox(width: Spacing.extraSmallSpacing()),
                      Text(
                        l10n.yearLabel,
                        style: ThemeFonts.of(context).extraSmallTextSingle,
                      ),
                    ],
                  ),
                  SizedBox(height: Spacing.generate(1)),
                  const Separator(),
                  SizedBox(height: Spacing.generate(1)),
                  Text(
                    l10n.monthAverageNumberLabel,
                    style: ThemeFonts.of(context).extraSmallTextSingle,
                  ),
                  SizedBox(height: Spacing.extraSmallSpacing()),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "${user.timesPerMonth}",
                        style: ThemeFonts.of(context).heading3,
                      ),
                      SizedBox(width: Spacing.extraSmallSpacing()),
                      Text(
                        l10n.numberLabel,
                        style: ThemeFonts.of(context).extraSmallTextSingle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: Spacing.generate(4)),
      Row(
        children: [
          SizedBox(
            width: Sizes.svgIconSize,
            height: Sizes.svgIconSize,
            child: Center(
              child: SvgPicture.asset("assets/images/bag.svg"),
            ),
          ),
          const SizedBox(width: 15.0),
          Text("${l10n.occupationLabel} : "),
          Text(user.occupation),
        ],
      ),
      SizedBox(height: Spacing.generate(2)),
      Row(
        children: [
          SizedBox(
            width: Sizes.svgIconSize,
            height: Sizes.svgIconSize,
            child: Center(
              child: SvgPicture.asset("assets/images/location.svg"),
            ),
          ),
          const SizedBox(width: 15.0),
          Text("${l10n.locationLabel} : "),
          Text(user.address),
        ],
      ),
      SizedBox(height: Spacing.generate(2)),
      Row(
        children: [
          SizedBox(
            width: Sizes.svgIconSize,
            height: Sizes.svgIconSize,
            child: Center(
              child: SvgPicture.asset("assets/images/security.svg"),
            ),
          ),
          const SizedBox(width: 15.0),
          Text("${l10n.affiliationLabel} : "),
          Row(children: clubWidgets),
        ],
      ),
      SizedBox(height: Spacing.generate(3)),
      Text(
        user.intro,
        style: ThemeFonts.of(context).commonTextSingle,
      ),
    ]);
  }

  Widget renderFollowingUsers(UserModel user) {
    final l10n = context.l10n;

    List<Widget> userWidgets = [];
    for (UserModel e in user.followingList) {
      userWidgets.add(
        Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image(
                width: 60.0,
                height: 60.0,
                image: AssetImage(
                    e.avatar == '' ? Config.getDefaultAvatarUrl() : e.avatar),
              ),
            ),
            SizedBox(height: Spacing.extraSmallSpacing()),
            Text(
              e.fullname,
              style: ThemeFonts.of(context)
                  .extraSmallTextSingle
                  .apply(color: ThemeColors.secondaryText),
            ),
          ],
        ),
      );

      if (e.id != user.followingList.last.id) {
        userWidgets.add(SizedBox(width: Spacing.generate(3)));
      }
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(l10n.followingLabel,
                style: ThemeFonts.of(context).smallTextSingle),
            Container(
              width: 40.0,
              height: 20.0,
              decoration: BoxDecoration(
                color: ThemeColors.neutral200,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  "${user.followingList.length}",
                  style: ThemeFonts.of(context)
                      .extraSmallTextSingle
                      .apply(color: ThemeColors.secondaryText),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: Spacing.generate(2)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: userWidgets,
          ),
        )
      ],
    );
  }

  Widget renderBlogs(UserModel user) {
    final l10n = context.l10n;

    List<Widget> userBlogs = [];
    for (BlogModel e in user.blogList) {
      userBlogs.add(SizedBox(
        width: MediaQuery.sizeOf(context).width - Spacing.generate(4),
        child: BlogCard(model: e),
      ));

      if (e.id != user.blogList.last.id) {
        userBlogs.add(SizedBox(width: Spacing.generate(1)));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${user.fullname}${l10n.sLabel} Blog",
          style: ThemeFonts.of(context).heading3,
        ),
        SizedBox(height: Spacing.generate(2)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: userBlogs,
          ),
        )
      ],
    );
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.appBarHeight,
          leading: IconButton(
            icon: const Icon(Icons.close, size: 25.0),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: ThemeColors.primaryBackground,
          actions: [
            CustomIconButton(
              icon: SvgPicture.asset(
                "assets/images/user_plus.svg",
                width: Sizes.headerSvgIconSize,
                height: Sizes.headerSvgIconSize,
              ),
              onPressed: () {
                debugPrint("member screen - follow button is pressed");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
            CustomIconButton(
              icon: const Icon(CupertinoIcons.chat_bubble,
                  color: ThemeColors.primaryText),
              onPressed: () {
                debugPrint("member screen - dm button is pressed");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
            CustomIconButton(
              icon: const Icon(Icons.block, color: ThemeColors.primaryText),
              onPressed: () {
                debugPrint("member screen - block button is pressed");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.generate(2),
          ),
          child: FutureBuilder(
            future: DummyService.getUserById(widget.id!),
            builder: (context, snapshot) {
              final result = snapshot.data != null
                  ? snapshot.data as UserModel
                  : UserModel(id: 'default_id');
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  renderUserInform(result),
                  renderScreenSpacing(),
                  renderFollowingUsers(result),
                  renderScreenSpacing(),
                  renderBlogs(result),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
