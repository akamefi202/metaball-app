import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/club/widgets/club_card.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/custom_icon_button.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/border_radius.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class MyClubListScreen extends StatefulWidget {
  const MyClubListScreen({super.key});
  @override
  State<MyClubListScreen> createState() => _MyClubListScreenState();
}

class _MyClubListScreenState extends State<MyClubListScreen> {
  final _currentUser = DummyService.getCurrentUser();

  @override
  void initState() {
    super.initState();
  }

  Widget renderClubList(List<ClubModel> clubList) {
    List<Widget> clubWidgets = [];

    for (ClubModel e in clubList) {
      clubWidgets.add(ClubCard(model: e));

      if (e.id != clubList.last.id) {
        clubWidgets.add(SizedBox(height: Spacing.generate(2)));
      }
    }

    return Column(children: clubWidgets);
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
          actions: [
            CustomIconButton(
              icon: const Icon(CupertinoIcons.plus),
              onPressed: () {
                debugPrint("my club screen - club create button is pressed");
                context.push(RouteKey.createClub.location);
              },
            ),
            SizedBox(width: Spacing.generate(2)),
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
          ),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  l10n.clubsLabel,
                  textAlign: TextAlign.left,
                  style: ThemeFonts.of(context).heading2,
                ),
              ),
              SizedBox(height: Spacing.generate(2)),
              Text(
                l10n.myClubHeadingText,
                style: ThemeFonts.of(context)
                    .commonTextSingle
                    .apply(color: ThemeColors.secondaryText),
              ),
              SizedBox(height: Spacing.generate(3)),
              FutureBuilder(
                future: DummyService.getClubListById(_currentUser.id),
                builder: (context, snapshot) {
                  final result = snapshot.data ?? [];
                  return renderClubList(result);
                },
              ),
              SizedBox(height: Spacing.generate(4)),
              InkWell(
                customBorder: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      ThemeBorderRadius.componentBorderRaduis()),
                ),
                onTap: () {
                  debugPrint(
                      "my club screen - search more clubs button is pressed");
                },
                child: Container(
                  padding: EdgeInsets.all(Spacing.generate(1)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          ThemeBorderRadius.componentBorderRaduis()),
                      border: Border.all(color: ThemeColors.componentBorder)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.search),
                      SizedBox(width: Spacing.generate(1)),
                      Text(l10n.searchMoreClubsButton,
                          style: ThemeFonts.of(context).bigTextSingle),
                    ],
                  ),
                ),
              ),
              SizedBox(height: Spacing.generate(4)),
            ],
          ),
        ),
      ),
    );
  }
}
