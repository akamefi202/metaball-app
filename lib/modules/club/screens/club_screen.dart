import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/club/widgets/club_card.dart';
import 'package:metaball_app/modules/home/widgets/event_card.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class ClubScreen extends StatefulWidget {
  final String? id;

  const ClubScreen({super.key, this.id});
  @override
  State<ClubScreen> createState() => _ClubScreenState();
}

class _ClubScreenState extends State<ClubScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget renderClubInform(ClubModel club) {
    final l10n = context.l10n;

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Spacing.pageHorizontalSpacing()),
      child: Column(children: [
        ClubCard(model: club, isStatic: true),
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
            Text("${l10n.presidentLabel} : "),
            Text(
              (club.president ?? UserModel(id: "default_user")).fullname,
              style: const TextStyle(color: ThemeColors.primaryButton),
            ),
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
            Text("${l10n.activeRegionLabel} : "),
            Text(club.region),
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
            Text("${l10n.memberEligibilityLabel} : "),
            Text(club.eligibility),
          ],
        ),
        SizedBox(height: Spacing.generate(3)),
        Text(
          club.description,
          style: ThemeFonts.of(context).commonTextSingle,
        ),
      ]),
    );
  }

  Widget renderMembers(ClubModel club) {
    final l10n = context.l10n;

    List<Widget> userWidgets = [];
    for (UserModel e in club.memberList) {
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

      if (e.id != club.memberList.last.id) {
        userWidgets.add(SizedBox(width: Spacing.generate(3)));
      }
    }

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Spacing.pageHorizontalSpacing()),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.memberLabel,
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
                    "${club.memberCount}",
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
      ),
    );
  }

  Widget renderEventsAds() {
    final l10n = context.l10n;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
          ),
          child: Text(
            l10n.pastEventsLabel,
            style: ThemeFonts.of(context).heading2,
          ),
        ),
        SizedBox(height: Spacing.generate(2)),
        FutureBuilder(
          future: DummyService.getEventList(),
          builder: (context, snapshot) {
            final result = snapshot.data ?? [];
            final widgets = <Widget>[];

            for (final element in result) {
              widgets.add(
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 0, horizontal: Spacing.generate(0.5)),
                  child: EventCard(model: element),
                ),
              );
            }

            return CarouselSlider(
              options: CarouselOptions(
                  viewportFraction:
                      (MediaQuery.sizeOf(context).width - Spacing.generate(3)) /
                          MediaQuery.sizeOf(context).width,
                  height: 180.0),
              items: widgets,
            );
          },
        ),
      ],
    );
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.appBarHeight,
          leading: IconButton(
            icon: const Icon(Icons.chevron_left, size: 25.0),
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
                debugPrint("club screen - follow button is pressed");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
            CustomIconButton(
              icon: const Icon(CupertinoIcons.chat_bubble,
                  color: ThemeColors.primaryText),
              onPressed: () {
                debugPrint("club screen - dm button is pressed");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
          ],
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: DummyService.getClubById(widget.id!),
            builder: (context, snapshot) {
              final result = snapshot.data != null
                  ? snapshot.data as ClubModel
                  : ClubModel(id: 'default_club');
              return Column(
                children: [
                  SizedBox(height: Spacing.generate(1)),
                  renderClubInform(result),
                  renderScreenSpacing(),
                  renderMembers(result),
                  renderScreenSpacing(),
                  renderEventsAds(),
                  SizedBox(height: Spacing.generate(3)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
