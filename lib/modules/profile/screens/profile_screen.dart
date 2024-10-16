import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/profile/widgets/custom_menu_item.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/switch_button.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/box_shadow.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _autoRecruit = false;
  final _currentUser = DummyService.getCurrentUser();

  void autoRecruitChanged(value) {
    debugPrint("toggle automatic recruitment");
    setState(() {
      _autoRecruit = value;
    });
  }

  Widget renderTopBar() {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SwitchButton(
          text: l10n.autoRecruitLabel,
          onChanged: autoRecruitChanged,
          value: _autoRecruit,
        ),
      ],
    );
  }

  Widget renderPageTitle() {
    final l10n = context.l10n;

    return SizedBox(
      width: double.infinity,
      child: Text(l10n.profilePageLabel,
          style: ThemeFonts.of(context).heading1, textAlign: TextAlign.left),
    );
  }

  Widget renderProfileMenuItem() {
    final l10n = context.l10n;

    return InkWell(
      onTap: () {
        debugPrint("profile screen - profile menu item is pressed");
        context.push(RouteKey.editProfile.location);
      },
      child: Padding(
        padding: EdgeInsets.all(Spacing.extraSmallSpacing()),
        child: Row(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(28.0),
            child: Image(
                width: 56.0,
                height: 56.0,
                image: AssetImage(_currentUser.avatar == ''
                    ? Config.getDefaultAvatarUrl()
                    : _currentUser.avatar)),
          ),
          SizedBox(width: Spacing.generate(1.5)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_currentUser.fullname,
                    style: ThemeFonts.of(context).heading4),
                SizedBox(height: Spacing.extraSmallSpacing()),
                Text(l10n.viewProfileLabel,
                    style: ThemeFonts.of(context)
                        .smallTextSingle
                        .apply(color: ThemeColors.secondaryText)),
              ],
            ),
          ),
          SizedBox(width: Spacing.generate(1.5)),
          const Icon(Icons.chevron_right),
        ]),
      ),
    );
  }

  Widget renderNewsMenuItem() {
    final l10n = context.l10n;

    return InkWell(
      onTap: () {
        debugPrint("profile screen - news menu item is pressed");
        context.push(RouteKey.newsList.location);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Spacing.generate(2),
          horizontal: Spacing.extraSmallSpacing(),
        ),
        child: Row(children: [
          Expanded(
            child: Row(children: [
              Flexible(
                child: Text(
                  "最新的News标题点击查看全部",
                  style: ThemeFonts.of(context).commonTextSingle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: Spacing.generate(1.5)),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Spacing.generate(0.5), vertical: 3.0),
                decoration: BoxDecoration(
                  color: ThemeColors.primaryButton,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  l10n.latestNewsTagLabel,
                  style: ThemeFonts.of(context)
                      .buttonText
                      .apply(color: ThemeColors.neutral100),
                ),
              ),
            ]),
          ),
          SizedBox(width: Spacing.generate(1.5)),
          const Icon(Icons.chevron_right),
        ]),
      ),
    );
  }

  Widget renderAds() {
    return Container(
        padding: EdgeInsets.all(Spacing.generate(2)),
        decoration: BoxDecoration(
          color: ThemeColors.primaryBackground,
          borderRadius:
              BorderRadius.circular(ThemeBorderRadius.componentBorderRaduis()),
          boxShadow: [ThemeBoxShadow.baseLight],
        ),
        child: Row(
          children: [
            Expanded(
              flex: 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "別荘購入からリフォーム",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: ThemeFonts.of(context).heading4,
                  ),
                  SizedBox(height: Spacing.generate(1)),
                  Text(
                    "ゴルフグッズやさまざまの広告を受けて、バナー編集して出します。",
                    style: ThemeFonts.of(context)
                        .smallTextSingle
                        .apply(color: ThemeColors.secondaryText),
                  ),
                ],
              ),
            ),
            SizedBox(width: Spacing.generate(1)),
            const Expanded(
              flex: 3,
              child: Image(
                image: AssetImage("assets/images/ads.png"),
              ),
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return SafeArea(
      top: true,
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.generate(2),
          ),
          child: Column(children: [
            renderTopBar(),
            SizedBox(height: Spacing.generate(2)),
            renderPageTitle(),
            SizedBox(height: Spacing.generate(4)),
            renderProfileMenuItem(),
            SizedBox(height: Spacing.generate(2)),
            renderNewsMenuItem(),
            SizedBox(height: Spacing.generate(2)),
            renderAds(),
            SizedBox(height: Spacing.generate(8)),
            CustomMenuItem(
              text: l10n.accountInformLabel,
              icon: 'assets/images/user.svg',
              onPressed: () {
                debugPrint(
                    "profile screen - account information menu item is pressed");
                context.push(RouteKey.accountInform.location);
              },
            ),
            CustomMenuItem(
              text: l10n.connectionLabel,
              icon: 'assets/images/connection.svg',
              onPressed: () {
                debugPrint("profile screen - connection menu item is pressed");
                context.push(RouteKey.connection.location);
              },
            ),
            CustomMenuItem(
              text: l10n.postLabel,
              icon: 'assets/images/message.svg',
              onPressed: () {
                debugPrint("profile screen - blog menu item is pressed");
                context.push(RouteKey.blogList.location);
              },
            ),
            CustomMenuItem(
              text: l10n.clubsLabel,
              icon: 'assets/images/club.svg',
              onPressed: () {
                debugPrint("profile screen - my club menu item is pressed");
                context.push(RouteKey.myClub.location);
              },
            ),
            SizedBox(height: Spacing.generate(4)),
            SizedBox(
                width: double.infinity,
                child: Text(l10n.servicesLabel,
                    style: ThemeFonts.of(context).heading2,
                    textAlign: TextAlign.left)),
            SizedBox(height: Spacing.generate(3)),
            CustomMenuItem(
              text: l10n.customerServiceLabel,
              icon: 'assets/images/customer_service.svg',
              onPressed: () {
                debugPrint(
                    "profile screen - customer service menu item is pressed");
              },
            ),
            CustomMenuItem(
              text: l10n.userGuideLabel,
              icon: 'assets/images/guide.svg',
              onPressed: () {
                debugPrint("profile screen - user guide menu item is pressed");
              },
            ),
            CustomMenuItem(
              text: l10n.userAgreementLabel,
              icon: 'assets/images/agreement.svg',
              onPressed: () {
                debugPrint(
                    "profile screen - user agreement menu item is pressed");
              },
            ),
            CustomMenuItem(
              text: l10n.companyInformLabel,
              icon: 'assets/images/links.svg',
              onPressed: () {
                debugPrint(
                    "profile screen - company information menu item is pressed");
              },
            ),
          ]),
        ),
      ),
    );
  }
}
