import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/play/enums/province.dart';
import 'package:metaball_app/modules/play/enums/round_host_type.dart';
import 'package:metaball_app/modules/play/widgets/province_card.dart';
import 'package:metaball_app/modules/play/widgets/theme_selection.dart';
import 'package:metaball_app/modules/shared/widgets/custom_dropdown_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class RoundListFilterScreen extends StatefulWidget {
  const RoundListFilterScreen({super.key});
  @override
  State<RoundListFilterScreen> createState() => _RoundListFilterScreenState();
}

class _RoundListFilterScreenState extends State<RoundListFilterScreen> {
  RoundHostType _roundHostType = RoundHostType.personal;
  Province _hostProvince = Province.japan;
  List<String> _roundThemes = [];
  List<String> _roundRestrictions = [];

  @override
  void initState() {
    super.initState();
  }

  Widget renderScreenSpacing() {
    return Column(children: [
      SizedBox(height: Spacing.generate(2)),
      const Separator(),
      SizedBox(height: Spacing.generate(2)),
    ]);
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

  Widget renderContent() {
    final l10n = context.l10n;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        vertical: Spacing.generate(2),
        horizontal: Spacing.pageHorizontalSpacing(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.hostRegionLabel, style: ThemeFonts.of(context).heading3),
          SizedBox(height: Spacing.generate(2)),
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
          SizedBox(height: Spacing.generate(2)),
          renderProvinceSelection(),
          renderScreenSpacing(),
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
          renderScreenSpacing(),
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
        ],
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
          title: Text(l10n.filterLabel, style: ThemeFonts.of(context).heading3),
          backgroundColor: ThemeColors.primaryBackground,
        ),
        body: renderContent(),
      ),
    );
  }
}
