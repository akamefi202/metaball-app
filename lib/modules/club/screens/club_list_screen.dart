import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/club/widgets/club_item.dart';
import 'package:metaball_app/modules/shared/models/club_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class ClubListScreen extends StatefulWidget {
  const ClubListScreen({super.key});
  @override
  State<ClubListScreen> createState() => _ClubListScreenState();
}

class _ClubListScreenState extends State<ClubListScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget renderClubs(List<ClubModel> clubList) {
    List<Widget> widgets = [];

    for (var e in clubList) {
      widgets.add(ClubItem(model: e));

      if (e.id != clubList.last.id) {
        widgets.add(SizedBox(height: Spacing.pageVerticalSpacing()));
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widgets,
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
          title: Text(l10n.clubsLabel, style: ThemeFonts.of(context).heading3),
          backgroundColor: ThemeColors.primaryBackground,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.generate(2),
          ),
          child: FutureBuilder(
            future: DummyService.getClubList(),
            builder: (context, snapshot) {
              final clubList = snapshot.data ?? [];
              List<ClubModel> ongoingClubList =
                  clubList.where((e) => e.isOngoing).toList();
              List<ClubModel> recruitingClubList =
                  clubList.where((e) => e.isRecruiting).toList();

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l10n.ongoingGroupLabel,
                      style: ThemeFonts.of(context).heading3),
                  SizedBox(height: Spacing.generate(4)),
                  renderClubs(ongoingClubList),
                  SizedBox(height: Spacing.generate(4)),
                  const Separator(),
                  SizedBox(height: Spacing.generate(4)),
                  Text(l10n.recruitingGroupLabel,
                      style: ThemeFonts.of(context).heading3),
                  SizedBox(height: Spacing.generate(4)),
                  renderClubs(recruitingClubList),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
