import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/home/widgets/round_card.dart';
import 'package:metaball_app/modules/rounding/widgets/round_filter_textfield.dart';
import 'package:metaball_app/modules/shared/models/round_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/theme/box_shadow.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';
import 'package:metaball_app/utils/dates.dart';

class RoundListScreen extends StatefulWidget {
  const RoundListScreen({super.key});
  @override
  State<RoundListScreen> createState() => _RoundListScreenState();
}

class _RoundListScreenState extends State<RoundListScreen> {
  List<DateTime> dateTabList = [];
  late DateTime selectedDate;

  @override
  void initState() {
    DateTime today = DateTime.now();
    selectedDate = today;
    for (var i = 0; i < 7; i++) {
      dateTabList.add(today.add(Duration(days: i)));
    }

    super.initState();
  }

  Widget renderTabs(List<RoundModel> roundList) {
    List<Widget> widgets = [];

    for (var date in dateTabList) {
      final selected = selectedDate == date;
      widgets.add(
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedDate = date;
            });
          },
          style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            padding: const EdgeInsets.all(0),
            minimumSize: const Size(0, 0),
            fixedSize: const Size(70.0, 70.0),
            shape: const BeveledRectangleBorder(),
            backgroundColor: ThemeColors.primaryBackground,
            shadowColor: Colors.transparent,
            disabledBackgroundColor: ThemeColors.primaryBackground,
          ),
          child: Container(
            width: 70.0,
            height: 70.0,
            decoration: BoxDecoration(
              border: Border(
                bottom: selected
                    ? const BorderSide(width: 1.5, color: Colors.black)
                    : BorderSide.none,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  getStringFromStartDateExceptYear(date),
                  style: TextStyle(
                      fontSize: 11.0,
                      color: selected
                          ? ThemeColors.primaryText
                          : ThemeColors.secondaryText),
                ),
                const SizedBox(height: 5.0),
                Text(
                  "${roundList.where((round) => compareDates(round.startTime!, date)).length}",
                  style: TextStyle(
                      fontSize: 11.0,
                      color: selected
                          ? ThemeColors.primaryText
                          : ThemeColors.secondaryText),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      padding:
          EdgeInsets.symmetric(vertical: 0, horizontal: Spacing.generate(2)),
      decoration: BoxDecoration(
          color: Colors.white, boxShadow: [ThemeBoxShadow.baseLight]),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: widgets),
      ),
    );
  }

  Widget renderRounds(List<RoundModel> roundList) {
    final filteredRoundList = roundList
        .where((e) => compareDates(e.startTime!, selectedDate))
        .toList();
    List<Widget> widgets = [];

    for (var round in filteredRoundList) {
      widgets.add(RoundCard(model: round));
    }

    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: Spacing.generate(2),
          horizontal: Spacing.pageHorizontalSpacing(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: widgets,
        ),
      ),
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
          centerTitle: true,
          title: RoundFilterTextfield(
            region: l10n.hokkaidoLabel,
            theme: l10n.theme1n2dLabel,
            restriction: l10n.noRestrictionLabel,
          ),
          backgroundColor: ThemeColors.primaryBackground,
        ),
        body: FutureBuilder(
          future: DummyService.getRoundList(),
          builder: (context, snapshot) {
            final roundList = snapshot.data ?? [];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                renderTabs(roundList),
                renderRounds(roundList),
              ],
            );
          },
        ),
      ),
    );
  }
}
