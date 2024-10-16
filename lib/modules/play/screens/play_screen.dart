import 'package:carousel_slider/carousel_slider.dart';
import 'package:date_picker_plus/date_picker_plus.dart';
import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/dashboard/enums/dashboard_screen_tab.dart';
import 'package:metaball_app/modules/home/widgets/event_card.dart';
import 'package:metaball_app/modules/home/widgets/round_card.dart';
import 'package:metaball_app/modules/home/widgets/theme_card.dart';
import 'package:metaball_app/modules/play/enums/province.dart';
import 'package:metaball_app/modules/play/enums/round_host_type.dart';
import 'package:metaball_app/modules/play/widgets/counter.dart';
import 'package:metaball_app/modules/play/widgets/custom_date_picker.dart';
import 'package:metaball_app/modules/play/widgets/hashtag_card.dart';
import 'package:metaball_app/modules/play/widgets/province_card.dart';
import 'package:metaball_app/modules/play/widgets/custom_time_picker.dart';
import 'package:metaball_app/modules/play/widgets/theme_selection.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/circular_textfield.dart';
import 'package:metaball_app/modules/shared/widgets/custom_dropdown_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_textarea.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_textfield.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/modules/shared/widgets/switch_button.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/spacing.dart';

class PlayScreen extends StatefulWidget {
  final Function(DashboardScreenTab tab)? onNavigateToTabPage;

  const PlayScreen({super.key, this.onNavigateToTabPage});
  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;
  bool _roundRecruit = false;

  RoundHostType _roundHostType = RoundHostType.personal;
  Province _hostProvince = Province.japan;
  int _roundMemberCount = 0;
  int _roundCost = 0;
  DateTime _roundStartTime = DateTime.now();
  bool _roundDateSelected = false;
  bool _roundTimeSelected = false;
  String _roundTitle = '';
  String _roundDescription = '';
  String _roundAddress1 = '';
  String _roundAddress2 = '';
  List<String> _roundThemes = [];
  List<String> _roundRestrictions = [];
  int _ageLowerLimit = 0;
  int _ageHigherLimit = 100;

  @override
  void initState() {
    _tabCtrl = TabController(length: 2, vsync: this);
    _tabCtrl.addListener(() {
      //debugPrint("play tab view listener");
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

    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: Spacing.pageHorizontalSpacing()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TabBar(
            controller: _tabCtrl,
            isScrollable: true,
            labelColor: ThemeColors.neutral900,
            unselectedLabelColor: ThemeColors.neutral600,
            indicatorSize: TabBarIndicatorSize.tab,
            tabAlignment: TabAlignment.start,
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            indicatorPadding: EdgeInsets.symmetric(
                vertical: 0, horizontal: Spacing.generate(1)),
            labelPadding: EdgeInsets.symmetric(
                vertical: 0, horizontal: Spacing.generate(1)),
            labelStyle: ThemeFonts.of(context).heading1,
            unselectedLabelStyle: ThemeFonts.of(context).heading2,
            dividerColor: Colors.transparent,
            indicatorColor: Colors.transparent,
            tabs: [
              Tab(text: l10n.joinTab),
              Tab(text: l10n.hostTab),
            ],
          ),
          SwitchButton(
            text: l10n.roundingRecruitLabel,
            value: _roundRecruit,
            onChanged: roundRecruitChanged,
          ),
        ],
      ),
    );
  }

  Widget renderSearchBar() {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.pageHorizontalSpacing(),
      ),
      child: GestureDetector(
        onTap: () {
          debugPrint("play screen - search bar is pressed");
        },
        child: Container(
          padding: EdgeInsets.all(Spacing.generate(1)),
          decoration: BoxDecoration(
            color: ThemeColors.secondaryBackground,
            borderRadius: BorderRadius.circular(
                ThemeBorderRadius.componentBorderRaduis()),
          ),
          child: Row(
            children: [
              const Icon(Icons.search, color: ThemeColors.neutral600),
              SizedBox(width: Spacing.generate(1)),
              Text(
                l10n.roundSearchPlaceholder,
                style: ThemeFonts.of(context)
                    .commonTextSingle
                    .apply(color: ThemeColors.neutral600),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderHashtags() {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.pageHorizontalSpacing(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Text(
              l10n.hashtagLabel,
              textAlign: TextAlign.left,
              style: ThemeFonts.of(context).heading2,
            ),
          ),
          SizedBox(height: Spacing.generate(1)),
          FutureBuilder(
            future: DummyService.getThemesList(),
            builder: (context, snapshot) {
              final themeList = snapshot.data ?? [];
              final shortThemeList = themeList.take(6);
              final widgets = <Widget>[];

              for (final element in shortThemeList) {
                widgets.add(SizedBox(
                  width: (MediaQuery.of(context).size.width -
                          Spacing.generate(6)) /
                      2,
                  child: HashtagCard(model: element),
                ));
              }

              return Wrap(
                spacing: Spacing.generate(2),
                children: widgets,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget renderRounds() {
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
              l10n.latestLabel,
              textAlign: TextAlign.left,
              style: ThemeFonts.of(context).heading2,
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
              debugPrint(
                  "play screen - round list - view more button is pressed");
              if (widget.onNavigateToTabPage != null) {
                widget.onNavigateToTabPage!(DashboardScreenTab.rounding);
              }
            },
          ),
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
                height: 180.0,
              ),
              items: widgets,
            );
          },
        ),
      ],
    );
  }

  Widget renderThemes() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.pageHorizontalSpacing(),
      ),
      child: Column(
        children: [
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
        ],
      ),
    );
  }

  Widget renderJoinTabSpacing() {
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

  Widget renderHostTabSpacing() {
    return Column(
      children: [
        SizedBox(height: Spacing.generate(3)),
        const Separator(),
        SizedBox(height: Spacing.generate(3)),
      ],
    );
  }

  Widget renderJoinTabView() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: Spacing.pageVerticalSpacing(), bottom: Spacing.generate(3)),
        child: Column(children: [
          renderSearchBar(),
          SizedBox(height: Spacing.generate(4)),
          renderHashtags(),
          SizedBox(height: Spacing.generate(6)),
          renderRounds(),
          renderJoinTabSpacing(),
          renderEventsAds(),
          renderJoinTabSpacing(),
          renderThemes(),
        ]),
      ),
    );
  }

  Widget renderProvinceSelection() {
    const provinceList = [
      Province.japan,
      Province.kanto,
      Province.hokkaido,
      Province.kansai,
      Province.tohoku,
      Province.chubu,
      Province.chugoku,
      Province.shikoku,
      Province.kyushu,
    ];
    List<Widget> widgets = [];

    for (final element in provinceList) {
      widgets.add(
        ProvinceCard(
          selected: element == _hostProvince,
          value: element,
          onPressed: () {
            debugPrint("province is selected");
            setState(() {
              _hostProvince = element;
            });
          },
        ),
      );

      if (element != provinceList.last) {
        widgets.add(const SizedBox(width: 12.0));
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: widgets),
    );
  }

  Widget renderRoundMemberCount() {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(l10n.memberCountLabel, style: ThemeFonts.of(context).heading4),
        Counter(
          value: _roundMemberCount,
          onIncreased: () {
            setState(() {
              _roundMemberCount += 1;
            });
          },
          onDecreased: () {
            setState(() {
              if (_roundMemberCount >= 1) {
                _roundMemberCount -= 1;
              }
            });
          },
        ),
      ],
    );
  }

  Widget renderAgeRestriction() {
    return Row(children: [
      Expanded(
        child: CircularTextField(
          onChanged: (value) {
            setState(() {
              _ageLowerLimit = value;
            });
          },
          keyboardType: TextInputType.number,
        ),
      ),
      SizedBox(width: Spacing.generate(1)),
      Text("~", style: ThemeFonts.of(context).heading2),
      SizedBox(width: Spacing.generate(1)),
      Expanded(
        child: CircularTextField(
          onChanged: (value) {
            setState(() {
              _ageHigherLimit = value;
            });
          },
          keyboardType: TextInputType.number,
        ),
      ),
    ]);
  }

  Widget renderRoundStartTime() {
    List<Widget> widgets = [];

    widgets.add(CustomDatePicker(
      value: _roundStartTime,
      selected: _roundDateSelected,
      onPressed: () async {
        final date = await showDatePickerDialog(
          context: context,
          minDate: DateTime.now(),
          maxDate: DateTime.now().add(const Duration(days: 365)),
        );

        if (date == null) {
          return;
        }
        setState(() {
          _roundStartTime = DateTime(date.year, date.month, date.day,
              _roundStartTime.hour, _roundStartTime.minute);
          _roundDateSelected = true;
        });
      },
    ));

    if (_roundDateSelected) {
      widgets.add(SizedBox(height: Spacing.generate(1.5)));
      widgets.add(CustomTimePicker(
        value: _roundStartTime,
        selected: _roundTimeSelected,
        onPressed: () async {
          final date = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );

          if (date == null) {
            return;
          }
          setState(() {
            _roundStartTime = DateTime(
                _roundStartTime.year,
                _roundStartTime.month,
                _roundStartTime.day,
                date.hour,
                date.minute);
            _roundTimeSelected = true;
          });
        },
      ));
    }

    return Column(children: widgets);
  }

  Widget renderHostTabView() {
    final l10n = context.l10n;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: Spacing.pageVerticalSpacing(),
        horizontal: Spacing.pageHorizontalSpacing(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomDropdownButton(
            value: _roundHostType == RoundHostType.personal
                ? l10n.personalLabel
                : l10n.clubsLabel,
            onChanged: (value) {
              setState(() {
                _roundHostType = value == l10n.personalLabel
                    ? RoundHostType.personal
                    : RoundHostType.club;
              });
            },
            items: [l10n.personalLabel, l10n.clubsLabel],
          ),
          SizedBox(height: Spacing.generate(3)),
          Text(l10n.hostPlaceLabel, style: ThemeFonts.of(context).heading3),
          SizedBox(height: Spacing.generate(2)),
          renderProvinceSelection(),
          renderHostTabSpacing(),
          renderRoundMemberCount(),
          SizedBox(height: Spacing.generate(2)),
          const Separator(),
          SizedBox(height: Spacing.generate(2)),
          renderRoundStartTime(),
          SizedBox(height: Spacing.generate(2)),
          const Separator(),
          SizedBox(height: Spacing.generate(2)),
          RoundedTextField(
            placeholder: l10n.costPlaceholder,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                _roundCost = value;
              });
            },
          ),
          SizedBox(height: Spacing.generate(2)),
          const Separator(),
          SizedBox(height: Spacing.generate(3)),
          Text(l10n.basicInformLabel, style: ThemeFonts.of(context).heading3),
          SizedBox(height: Spacing.generate(2)),
          RoundedTextField(
            placeholder: l10n.titlePlaceholder,
            onChanged: (value) {
              setState(() {
                _roundTitle = value;
              });
            },
          ),
          SizedBox(height: Spacing.generate(2)),
          RoundedTextArea(
            placeholder: l10n.descriptionPlaceholder,
            onChanged: (value) {
              setState(() {
                _roundDescription = value;
              });
            },
          ),
          renderHostTabSpacing(),
          Text(l10n.golfCourseLabel, style: ThemeFonts.of(context).heading4),
          SizedBox(height: Spacing.generate(2)),
          RoundedTextField(
            placeholder: l10n.addressNamePlaceholder,
            onChanged: (value) {
              setState(() {
                _roundAddress1 = value;
              });
            },
          ),
          SizedBox(height: Spacing.generate(2)),
          RoundedTextField(
            placeholder: l10n.detailedAddressPlaceholder,
            onChanged: (value) {
              setState(() {
                _roundAddress2 = value;
              });
            },
          ),
          renderHostTabSpacing(),
          Text(l10n.themeLabel, style: ThemeFonts.of(context).heading3),
          SizedBox(height: Spacing.generate(2)),
          ThemeSelection(
            themes: [
              l10n.themeWelcomeNewcomerLabel,
              l10n.themeWeekendGolfLabel,
              l10n.themeProBattleLabel,
              l10n.theme1n2dLabel,
              l10n.themeFreeLabel,
              l10n.themeDrinkLabel,
              l10n.themeEnteringLabel,
              l10n.themeMarriageLabel,
              l10n.themeClubBattleLabel,
            ],
            selectedThemes: _roundThemes,
            onSelected: (value) {
              setState(() {
                if (!_roundThemes.contains(value)) {
                  _roundThemes.add(value);
                }
              });
            },
            onDeselected: (value) {
              setState(() {
                if (_roundThemes.contains(value)) {
                  _roundThemes.remove(value);
                }
              });
            },
          ),
          renderHostTabSpacing(),
          Text(l10n.restrictionLabel, style: ThemeFonts.of(context).heading3),
          SizedBox(height: Spacing.generate(2)),
          ThemeSelection(
            themes: [
              l10n.restriction70yoLabel,
              l10n.restriction80yoLabel,
              l10n.restriction90yoLabel,
              l10n.restriction100yoLabel,
              l10n.femaleLabel,
              l10n.maleLabel,
              l10n.noRestrictionLabel,
            ],
            selectedThemes: _roundRestrictions,
            onSelected: (value) {
              setState(() {
                if (!_roundRestrictions.contains(value)) {
                  _roundRestrictions.add(value);
                  debugPrint(value);
                }
              });
            },
            onDeselected: (value) {
              setState(() {
                if (_roundRestrictions.contains(value)) {
                  _roundRestrictions.remove(value);
                }
              });
            },
          ),
          SizedBox(height: Spacing.generate(2)),
          Text(l10n.ageLabel, style: ThemeFonts.of(context).heading4),
          SizedBox(height: Spacing.generate(2)),
          renderAgeRestriction(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: Spacing.generate(2)),
          child: Column(
            children: [
              renderTopBar(),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabCtrl,
                  children: [
                    renderJoinTabView(),
                    renderHostTabView(),
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
