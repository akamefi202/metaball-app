import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/club/widgets/club_member_button_item.dart';
import 'package:metaball_app/modules/club/widgets/club_member_item.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class ClubMemberListScreen extends StatefulWidget {
  final String? clubId;

  const ClubMemberListScreen({super.key, this.clubId});
  @override
  State<ClubMemberListScreen> createState() => _ClubMemberListScreenState();
}

class _ClubMemberListScreenState extends State<ClubMemberListScreen> {
  int _clubMemberCount = 0;

  @override
  void initState() {
    super.initState();

    //ClubModel clubData = await DummyService.getClubById(widget.clubId!);
    //_clubMemberCount = clubData.memberCount;
  }

  Widget renderMembers() {
    final l10n = context.l10n;

    return FutureBuilder(
      future: DummyService.getClubMemberListByClubId(widget.clubId!),
      builder: (context, snapshot) {
        final memberList = snapshot.data ?? [];
        List<Widget> widgets = [];

        for (var member in memberList) {
          widgets.add(SizedBox(
            width: 60.0,
            child: Center(child: ClubMemberItem(model: member)),
          ));
        }

        widgets.add(
          SizedBox(
            width: 60.0,
            child: Center(
              child: ClubMemberButtonItem(
                label: l10n.addLabel,
                icon: const Icon(CupertinoIcons.add, size: 20.0),
                onPressed: () {
                  context.push(
                      "${RouteKey.clubMemberRecruit.location}/${widget.clubId}");
                },
              ),
            ),
          ),
        );
        widgets.add(
          SizedBox(
            width: 60.0,
            child: Center(
              child: ClubMemberButtonItem(
                label: l10n.removeButton,
                icon: const Icon(CupertinoIcons.minus, size: 20.0),
                onPressed: () {
                  context.push(
                      "${RouteKey.clubMemberRemove.location}/${widget.clubId}");
                },
              ),
            ),
          ),
        );

        return Wrap(
          spacing:
              (MediaQuery.sizeOf(context).width - 300.0 - Spacing.generate(4)) /
                  4.0,
          runSpacing: Spacing.generate(2),
          children: widgets,
        );
      },
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
          backgroundColor: ThemeColors.primaryBackground,
          centerTitle: true,
          title: Text("${l10n.clubMembersLabel}($_clubMemberCount)",
              style: ThemeFonts.of(context).heading3),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
            horizontal: Spacing.pageHorizontalSpacing(),
            vertical: Spacing.pageVerticalSpacing(),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Separator(),
              SizedBox(height: Spacing.generate(2)),
              renderMembers(),
            ],
          ),
        ),
      ),
    );
  }
}
