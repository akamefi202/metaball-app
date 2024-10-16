import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/club/widgets/club_member_button_item.dart';
import 'package:metaball_app/modules/club/widgets/club_member_item.dart';
import 'package:metaball_app/modules/club/widgets/settings_edit_item.dart';
import 'package:metaball_app/modules/club/widgets/settings_icon_item.dart';
import 'package:metaball_app/modules/club/widgets/settings_switch_item.dart';
import 'package:metaball_app/modules/shared/enums/circular_button_style.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/modules/shared/widgets/circular_button.dart';
import 'package:metaball_app/modules/shared/widgets/separator.dart';
import 'package:metaball_app/routing/routing.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class ClubSettingsScreen extends StatefulWidget {
  final String? id;

  const ClubSettingsScreen({super.key, this.id});
  @override
  State<ClubSettingsScreen> createState() => _ClubSettingsScreenState();
}

class _ClubSettingsScreenState extends State<ClubSettingsScreen> {
  bool _latestNewsNotification = false;
  String _admins = "张三, 李四";
  String _president = "佐藤 勝彦";

  @override
  void initState() {
    super.initState();
  }

  Widget renderMembers() {
    final l10n = context.l10n;

    return FutureBuilder(
      future: DummyService.getClubMemberListByClubId(widget.id!),
      builder: (context, snapshot) {
        final memberList = snapshot.data ?? [];
        final shortMemberList = memberList.take(13);
        List<Widget> widgets = [];

        for (var member in shortMemberList) {
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
                      "${RouteKey.clubMemberRecruit.location}/${widget.id}");
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
                      "${RouteKey.clubMemberRemove.location}/${widget.id}");
                },
              ),
            ),
          ),
        );

        return Column(children: [
          Wrap(
            spacing: (MediaQuery.sizeOf(context).width -
                    300.0 -
                    Spacing.generate(4)) /
                4.0,
            runSpacing: Spacing.generate(2),
            children: widgets,
          ),
          SizedBox(height: Spacing.generate(3)),
          CircularButton(
            text: l10n.viewAllMembersLabel,
            buttonStyle: CircularButtonStyle.outlined,
            color: ThemeColors.primaryText,
            minimumSize: const Size(180.0, 40.0),
            onPressed: () {
              context.push("${RouteKey.clubMemberList.location}/${widget.id}");
            },
          ),
        ]);
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
          title: Text(l10n.clubSettingsLabel,
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
              SettingsSwitchItem(
                label: l10n.latestNotificationLabel,
                value: _latestNewsNotification,
                onChanged: (value) {
                  setState(() {
                    _latestNewsNotification = value;
                  });
                },
              ),
              SizedBox(height: Spacing.generate(4)),
              Text(l10n.clubMembersLabel,
                  style: ThemeFonts.of(context).heading3),
              SizedBox(height: Spacing.generate(1)),
              const Separator(),
              SizedBox(height: Spacing.generate(2)),
              renderMembers(),
              SizedBox(height: Spacing.generate(3)),
              const Separator(),
              SettingsEditItem(
                label: l10n.administratorLabel,
                value: _admins,
                onPressed: () {
                  debugPrint(
                      "club settings screen - admins edit item is pressed");
                },
              ),
              SettingsEditItem(
                label: l10n.transferPresidentLabel,
                value: _president,
                onPressed: () {
                  debugPrint(
                      "club settings screen - president edit item is pressed");
                },
              ),
              SettingsEditItem(
                label: l10n.editClubLabel,
                onPressed: () {
                  debugPrint(
                      "club settings screen - edit club item is pressed");
                },
              ),
              SettingsIconItem(
                label: l10n.leaveClubLabel,
                icon: const Icon(Icons.logout, size: 25.0),
                onPressed: () {
                  debugPrint(
                      "club settings screen - leave club item is pressed");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
