import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/play/widgets/theme_selection.dart';
import 'package:metaball_app/modules/shared/widgets/circular_textfield.dart';
import 'package:metaball_app/modules/shared/widgets/custom_dropdown_button.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class RoundRecruitFilterScreen extends StatefulWidget {
  const RoundRecruitFilterScreen({super.key});
  @override
  State<RoundRecruitFilterScreen> createState() =>
      _RoundRecruitFilterScreenState();
}

class _RoundRecruitFilterScreenState extends State<RoundRecruitFilterScreen> {
  int ageLowerLimit = 0;
  int ageHigherLimit = 0;
  List<String> userRestriction = [];

  @override
  void initState() {
    super.initState();
  }

  Widget renderAgeRestriction() {
    final l10n = context.l10n;

    return Row(children: [
      Expanded(
        child: CircularTextField(
          onChanged: (value) {
            setState(() {
              ageLowerLimit = value;
            });
          },
          placeholder: l10n.yoLabel,
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
              ageHigherLimit = value;
            });
          },
          placeholder: l10n.yoLabel,
          keyboardType: TextInputType.number,
        ),
      ),
    ]);
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
          backgroundColor: ThemeColors.primaryBackground,
          title: Text(l10n.filterLabel, style: ThemeFonts.of(context).heading3),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Spacing.generate(2),
            horizontal: Spacing.pageHorizontalSpacing(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ThemeSelection(
                    themes: [
                      l10n.maleOnlyLabel,
                      l10n.femaleOnlyLabel,
                      l10n.unlimitedLabel,
                    ],
                    selectedThemes: userRestriction,
                    onSelected: (value) {
                      setState(() {
                        userRestriction = [value];
                      });
                    },
                    onDeselected: (value) {
                      setState(() {
                        userRestriction = [];
                      });
                    },
                  ),
                  SizedBox(height: Spacing.generate(3)),
                  const Separator(),
                  SizedBox(height: Spacing.generate(3)),
                  CustomDropdownButton(
                    placeholder: l10n.golfClubCountLabel,
                  ),
                  SizedBox(height: Spacing.generate(2)),
                  CustomDropdownButton(
                    placeholder: l10n.majorActiveRegionLabel,
                  ),
                  SizedBox(height: Spacing.generate(2)),
                  CustomDropdownButton(
                    placeholder: l10n.locationLabel,
                  ),
                  SizedBox(height: Spacing.generate(3)),
                  Text(l10n.ageLabel,
                      style: ThemeFonts.of(context).smallTextSingle),
                  SizedBox(height: Spacing.generate(1)),
                  renderAgeRestriction(),
                  SizedBox(height: Spacing.generate(3)),
                  const Separator(),
                ],
              ),
              RoundedButton(
                text: l10n.confirmButton,
                onPressed: () {
                  debugPrint(
                      "round recruit filter screen - confirm button is pressed");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
