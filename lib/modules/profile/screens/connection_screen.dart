import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/profile/enums/follower_type.dart';
import 'package:metaball_app/modules/profile/widgets/follower_item.dart';
import 'package:metaball_app/modules/shared/models/user_model.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/theme/box_shadow.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';
import 'package:metaball_app/theme/sizes.dart';
import 'package:metaball_app/theme/spacing.dart';

class ConnectionScreen extends StatefulWidget {
  const ConnectionScreen({super.key});
  @override
  State<ConnectionScreen> createState() => _ConnectionScreenState();
}

class _ConnectionScreenState extends State<ConnectionScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabCtrl;

  @override
  void initState() {
    _tabCtrl = TabController(length: 2, vsync: this);
    _tabCtrl.addListener(() {
      //debugPrint("play tab view listener");
    });

    super.initState();
  }

  Widget renderTopBar() {
    final l10n = context.l10n;

    return Container(
      decoration: BoxDecoration(
        color: ThemeColors.primaryBackground,
        boxShadow: [ThemeBoxShadow.baseLight],
      ),
      child: TabBar(
        padding: EdgeInsets.symmetric(horizontal: Spacing.generate(1)),
        controller: _tabCtrl,
        isScrollable: true,
        dividerColor: Colors.transparent,
        indicatorColor: ThemeColors.primaryText,
        unselectedLabelColor: ThemeColors.secondaryText,
        labelColor: ThemeColors.primaryText,
        labelStyle: ThemeFonts.of(context).heading4,
        tabAlignment: TabAlignment.start,
        tabs: [
          Tab(text: l10n.followedTab),
          Tab(text: l10n.followingTab),
        ],
      ),
    );
  }

  Widget renderUserList(List<UserModel> userList) {
    final l10n = context.l10n;
    List<Widget> userWidgets = [];

    if (userList.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: 200.0,
        child: Center(child: Text(l10n.noFollowerText)),
      );
    }

    for (UserModel e in userList) {
      userWidgets.add(FollowerItem(model: e));
    }

    return Column(children: userWidgets);
  }

  Widget renderTabViewPage(FollowerType tab) {
    AsyncValueGetter<List<UserModel>> getUserListFunc;

    switch (tab) {
      case FollowerType.followed:
        getUserListFunc = DummyService.getFollowedUserList;
        break;
      case FollowerType.following:
        getUserListFunc = DummyService.getFollowingUserList;
        break;
    }

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: Spacing.pageHorizontalSpacing(),
        vertical: Spacing.generate(2),
      ),
      child: FutureBuilder(
        future: getUserListFunc.call(),
        builder: (context, snapshot) {
          final result = snapshot.data ?? [];

          return renderUserList(result);
        },
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
          backgroundColor: ThemeColors.primaryBackground,
          title: Text(l10n.connectionLabel,
              style: ThemeFonts.of(context).heading3),
          centerTitle: true,
        ),
        body: Column(
          children: [
            renderTopBar(),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabCtrl,
                children: [
                  renderTabViewPage(FollowerType.followed),
                  renderTabViewPage(FollowerType.following),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
