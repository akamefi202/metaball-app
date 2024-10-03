import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/home/widgets/round_card.dart';
import 'package:metaball_app/modules/shared/enums/round_status.dart';
import 'package:metaball_app/modules/shared/models/round_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/switch_button.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class RoundingScreen extends StatefulWidget {
  const RoundingScreen({super.key});
  @override
  State<RoundingScreen> createState() => _RoundingScreenState();
}

class _RoundingScreenState extends State<RoundingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;
  bool _roundRecruit = false;

  @override
  void initState() {
    _tabCtrl = TabController(length: 4, vsync: this);
    _tabCtrl.addListener(() {
      //debugPrint("rounding tab view listener");
    });

    super.initState();
  }

  void roundRecruitChanged(value) {
    debugPrint("toggle rounding recruitment");
    setState(() {
      _roundRecruit = value;
    });
  }

  Widget renderTopBar() {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SwitchButton(
          text: l10n.roundingRecruitLabel,
          onChanged: roundRecruitChanged,
          value: _roundRecruit,
        ),
      ],
    );
  }

  Widget renderPageTitle() {
    final l10n = context.l10n;

    return SizedBox(
      width: double.infinity,
      child: Text(l10n.roundingLabel, style: ThemeFonts.of(context).heading1),
    );
  }

  Widget renderRoundList(List<RoundModel> roundList) {
    final l10n = context.l10n;

    if (roundList.isEmpty) {
      return Center(child: Text(l10n.noRoundText));
    }

    return SingleChildScrollView(
      child:
          Column(children: roundList.map((e) => RoundCard(model: e)).toList()),
    );
  }

  Widget renderRoundTabBar() {
    final l10n = context.l10n;

    return TabBar(
      controller: _tabCtrl,
      isScrollable: true,
      labelColor: ThemeColors.neutral100,
      unselectedLabelColor: ThemeColors.neutral900,
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(
          30,
        ),
        color: ThemeColors.neutral900,
      ),
      indicatorSize: TabBarIndicatorSize.tab,
      indicatorPadding: EdgeInsets.symmetric(
          vertical: 0, horizontal: Spacing.extraSmallSpacing()),
      labelPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25.0),
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      tabs: [
        Tab(text: l10n.hostLabel),
        Tab(text: l10n.requestLabel),
        Tab(text: l10n.inviteLabel),
        Tab(text: l10n.followLabel),
      ],
    );
  }

  Widget renderRoundTabView() {
    return FutureBuilder(
        future: DummyService.getRoundList(),
        builder: (context, snapshot) {
          final result = snapshot.data ?? [];

          return TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabCtrl,
            children: [
              renderRoundList(
                  result.where((e) => e.status == RoundStatus.hosted).toList()),
              renderRoundList(result
                  .where((e) => e.status == RoundStatus.requested)
                  .toList()),
              renderRoundList(result
                  .where((e) => e.status == RoundStatus.invited)
                  .toList()),
              renderRoundList(result
                  .where((e) => e.status == RoundStatus.followed)
                  .toList()),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            left: Spacing.generate(2),
            right: Spacing.generate(2),
            top: Spacing.generate(2),
          ),
          child: Column(children: [
            renderTopBar(),
            SizedBox(height: Spacing.extraSmallSpacing()),
            renderPageTitle(),
            SizedBox(height: Spacing.generate(2)),
            renderRoundTabBar(),
            SizedBox(height: Spacing.generate(3)),
            Expanded(child: renderRoundTabView()),
          ]),
        ),
      ),
    );
  }
}
