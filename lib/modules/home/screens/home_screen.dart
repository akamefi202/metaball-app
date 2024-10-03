import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/home/widgets/theme_card.dart';
import 'package:metaball_app/modules/home/widgets/blog_card.dart';
import 'package:metaball_app/modules/home/widgets/event_card.dart';
import 'package:metaball_app/modules/home/widgets/round_card.dart';
import 'package:metaball_app/modules/home/widgets/rounding_tab_button.dart';
import 'package:metaball_app/modules/home/widgets/tag_button.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/modules/shared/widgets/outlined_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/box_shadow.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _roundingTabCtrl;

  @override
  void initState() {
    _roundingTabCtrl = TabController(length: 3, vsync: this);
    _roundingTabCtrl.addListener(() {
      setState(() {});
    });

    _getData();

    super.initState();
  }

  void _getData() async {}

  Widget renderTopBar() {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: Spacing.pageVerticalSpacing(),
        horizontal: Spacing.pageHorizontalSpacing(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder(
            future: DummyService.getCurrentUser(),
            builder: (context, snapshot) {
              final result = snapshot.data != null
                  ? snapshot.data as UserModel
                  : UserModel(id: 'default_id');

              return Row(children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(17.0),
                      child: Image(
                          width: 34.0,
                          height: 34.0,
                          image: AssetImage(result.avatar.isEmpty
                              ? Config.getDefaultAvatar()
                              : result.avatar)),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: ThemeColors.primaryButton,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        width: 8.0,
                        height: 8.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(width: Spacing.generate(1)),
                Text(result.fullname),
              ]);
            },
          ),
          Row(children: [
            CustomIconButton(
              icon: const Icon(Icons.star, color: ThemeColors.primaryText),
              onPressed: () {
                debugPrint("top bar favorite");
              },
            ),
            SizedBox(width: Spacing.generate(2)),
            CustomIconButton(
              icon: const Icon(Icons.search, color: ThemeColors.primaryText),
              onPressed: () {
                debugPrint("top bar search");
              },
            ),
          ]),
        ],
      ),
    );
  }

  Widget renderRoundingButtons() {
    final l10n = context.l10n;

    return Container(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 24.0),
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: [ThemeBoxShadow.baseLight]),
        child: Row(children: [
          RoundingTabButton(
            text: l10n.startingSoonLabel,
            icon: CupertinoIcons.clock,
            underlined: true,
          ),
          const SizedBox(width: 30.0),
          RoundingTabButton(
            text: l10n.filterLabel,
            icon: CupertinoIcons.slider_horizontal_3,
            onPressed: () {
              debugPrint("navigate to round calendar screen");
            },
          ),
          const SizedBox(width: 30.0),
          RoundingTabButton(
            text: l10n.clubsLabel,
            icon: CupertinoIcons.checkmark_shield,
            onPressed: () {
              debugPrint("navigate to club list screen");
            },
          ),
        ]));
  }

  Widget renderRounds() {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.pageHorizontalSpacing(),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: Spacing.generate(2),
          horizontal: Spacing.pageHorizontalSpacing(),
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            boxShadow: [ThemeBoxShadow.baseLight]),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(
                l10n.startingSoonLabel,
                textAlign: TextAlign.left,
                style: ThemeFonts.of(context).heading1,
              ),
            ),
            SizedBox(height: Spacing.pageVerticalSpacing()),
            FutureBuilder(
              future: DummyService.getRoundList(),
              builder: (context, snapshot) {
                final result = snapshot.data ?? [];
                final shortResult =
                    result.length > 4 ? result.getRange(0, 4) : result;

                return Column(
                    children:
                        shortResult.map((e) => RoundCard(model: e)).toList());
              },
            ),
            SizedBox(height: Spacing.generate(2)),
            RoundedButton(
              text: l10n.viewMoreLabel,
              onPressed: () {
                debugPrint("round list view more");
              },
            ),
          ],
        ),
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
            l10n.recommendedEventsLabel,
            style: ThemeFonts.of(context).heading1,
          ),
        ),
        const SizedBox(height: 6.0),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
          ),
          child: Text(
            l10n.inPromotionLabel,
            style: ThemeFonts.of(context)
                .heading6
                .apply(color: ThemeColors.primaryButton),
          ),
        ),
        SizedBox(height: Spacing.pageVerticalSpacing()),
        FutureBuilder(
          future: DummyService.getEventList(),
          builder: (context, snapshot) {
            final result = snapshot.data ?? [];
            final widgets = <Widget>[];

            for (final element in result) {
              widgets.add(
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 6.0),
                  child: EventCard(model: element),
                ),
              );
            }

            return CarouselSlider(
              options: CarouselOptions(viewportFraction: 0.9, height: 180.0),
              items: widgets,
            );
          },
        ),
      ],
    );
  }

  Widget renderThemes() {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.pageHorizontalSpacing(),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              l10n.trendingLabel,
              textAlign: TextAlign.left,
              style: ThemeFonts.of(context)
                  .heading4
                  .apply(color: ThemeColors.neutral600),
            ),
          ),
          const SizedBox(height: 6.0),
          SizedBox(
            width: double.infinity,
            child: Text(
              l10n.popularThemesLabel,
              textAlign: TextAlign.left,
              style: ThemeFonts.of(context).heading1,
            ),
          ),
          SizedBox(height: Spacing.generate(1)),
          FutureBuilder(
            future: DummyService.getThemesList(),
            builder: (context, snapshot) {
              final result = snapshot.data ?? [];
              final shortResult =
                  result.length > 2 ? result.getRange(0, 2) : result;
              final widgets = <Widget>[];

              for (final element in shortResult) {
                widgets.add(ThemeCard(model: element));

                if (element.id != shortResult.last.id) {
                  widgets.add(SizedBox(height: Spacing.generate(2)));
                }
              }

              return Column(children: widgets);
            },
          ),
          SizedBox(height: Spacing.generate(3)),
          CustomOutlinedButton(
            text: l10n.viewMoreLabel,
            onPressed: () {
              debugPrint("view more themes");
            },
          ),
        ],
      ),
    );
  }

  Widget renderBlogs() {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.pageHorizontalSpacing(),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.primaryBackground,
          boxShadow: [ThemeBoxShadow.baseLight],
          borderRadius:
              BorderRadius.circular(BorderRadiusValue.componentBorderRaduis()),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: Spacing.generate(1),
                horizontal: Spacing.pageHorizontalSpacing(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(l10n.blogLabel,
                          style: ThemeFonts.of(context)
                              .heading5
                              .apply(color: ThemeColors.neutral600)),
                      TagButton(
                        text: l10n.viewAllLabel,
                        onPressed: () {
                          debugPrint("view all blogs");
                        },
                      ),
                    ],
                  ),
                  Text(l10n.titleEditableBackgroundLabel,
                      style: ThemeFonts.of(context).heading1),
                ],
              ),
            ),
            SizedBox(height: Spacing.generate(2)),
            FutureBuilder(
              future: DummyService.getBlogList(),
              builder: (context, snapshot) {
                final result = snapshot.data ?? [];
                final widgets = <Widget>[];

                for (final element in result) {
                  widgets.add(Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 6.0),
                    child: BlogCard(model: element),
                  ));
                }

                return CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.9,
                    height: 280,
                  ),
                  items: widgets,
                );
              },
            ),
            SizedBox(height: Spacing.generate(4)),
          ],
        ),
      ),
    );
  }

  Widget renderHomeScreenSpacing() {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              renderTopBar(),
              renderRoundingButtons(),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: Spacing.generate(3),
                  horizontal: 0,
                ),
                child: Column(
                  children: [
                    renderRounds(),
                    renderHomeScreenSpacing(),
                    renderEventsAds(),
                    renderHomeScreenSpacing(),
                    renderThemes(),
                    renderHomeScreenSpacing(),
                    renderBlogs(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
