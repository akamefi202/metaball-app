import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/rounding/widgets/recruit_item.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/rounded_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class RoundRecruitScreen extends StatefulWidget {
  final String? roundId;

  const RoundRecruitScreen({super.key, this.roundId});
  @override
  State<RoundRecruitScreen> createState() => _RoundRecruitScreenState();
}

class _RoundRecruitScreenState extends State<RoundRecruitScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget renderTopBar(List<UserModel> userList) {
    final l10n = context.l10n;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              l10n.filteredResultLabel,
              style: ThemeFonts.of(context).heading1,
            ),
            Text(
              "${userList.length}${l10n.personLabel}",
              style: ThemeFonts.of(context)
                  .extraSmallTextSingle
                  .apply(color: ThemeColors.secondaryText, heightFactor: 1.5),
            )
          ],
        ),
        InkWell(
          onTap: () {
            debugPrint(
                "round recruit screen - recruit filter button is pressed");
            context.push(RouteKey.roundRecruitFilter.location);
          },
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SvgPicture.asset(
              "assets/images/filter.svg",
              width: 25.0,
              height: 25.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget renderUserList(List<UserModel> userList) {
    List<Widget> userWidgets = [];

    for (UserModel e in userList) {
      userWidgets.add(RecruitItem(model: e));
    }

    return Column(children: userWidgets);
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
          title:
              Text(l10n.recruitButton, style: ThemeFonts.of(context).heading3),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.generate(2),
          ),
          child: FutureBuilder(
            future: DummyService.getUserList(),
            builder: (context, snapshot) {
              final userList = snapshot.data ?? [];

              return Column(
                children: [
                  renderTopBar(userList),
                  SizedBox(height: Spacing.generate(1)),
                  const Separator(),
                  SizedBox(height: Spacing.generate(2)),
                  Expanded(
                    child:
                        SingleChildScrollView(child: renderUserList(userList)),
                  ),
                  SizedBox(height: Spacing.generate(3)),
                  RoundedButton(
                    text: l10n.recruitAllButton,
                    onPressed: () {
                      debugPrint(
                          "round recruit screen - invite all button is pressed");
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
