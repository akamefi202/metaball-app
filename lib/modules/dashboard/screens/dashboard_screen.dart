import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/auth/screens/unauthorized_screen.dart';
import 'package:metaball_app/modules/dashboard/enums/dashboard_screen_tab.dart';
import 'package:metaball_app/modules/home/screens/home_screen.dart';
import 'package:metaball_app/modules/rounding/screens/rounding_screen.dart';
import 'package:metaball_app/modules/play/screens/play_screen.dart';
import 'package:metaball_app/modules/message/screens/message_screen.dart';
import 'package:metaball_app/modules/profile/screens/profile_screen.dart';
import 'package:metaball_app/modules/shared/services/dummy_service.dart';
import 'package:metaball_app/theme/colors.dart';
import 'package:metaball_app/theme/fonts.dart';

class DashboardScreen extends StatefulWidget {
  final DashboardScreenTab tab;

  const DashboardScreen({super.key, this.tab = DashboardScreenTab.home});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final _defaultColor = ThemeColors.neutral300;
  final _activeColor = ThemeColors.primaryButton;
  int _currentIndex = 0;
  final PageController _controller = PageController(
    initialPage: 0,
  );

  // navigate to tab pages inside the dashboard screen
  // pass navigateToTabPage function as a parameter to tab screens
  void navigateToTabPage(DashboardScreenTab tab) {
    int index = 0;
    switch (tab) {
      case DashboardScreenTab.home:
        index = 0;
      case DashboardScreenTab.rounding:
        index = 1;
      case DashboardScreenTab.play:
        index = 2;
      case DashboardScreenTab.message:
        index = 3;
      case DashboardScreenTab.profile:
        index = 4;
    }

    _controller.jumpToPage(index);
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _controller,
        children: <Widget>[
          HomeScreen(onNavigateToTabPage: navigateToTabPage),
          DummyService.isSignedIn()
              ? const RoundingScreen()
              : UnauthorizedScreen(pageTitle: l10n.roundingLabel),
          DummyService.isSignedIn()
              ? PlayScreen(onNavigateToTabPage: navigateToTabPage)
              : UnauthorizedScreen(pageTitle: l10n.participatedLabel),
          DummyService.isSignedIn()
              ? const MessageScreen()
              : UnauthorizedScreen(pageTitle: l10n.messageLabel),
          DummyService.isSignedIn()
              ? const ProfileScreen()
              : UnauthorizedScreen(pageTitle: l10n.profileLabel),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: _activeColor,
        unselectedItemColor: _defaultColor,
        selectedLabelStyle: ThemeFonts.of(context).navItemLabel,
        unselectedLabelStyle: ThemeFonts.of(context).navItemLabel,
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: _defaultColor),
            activeIcon: Icon(Icons.home, color: _activeColor),
            label: l10n.homeLabel,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.star, color: _defaultColor),
              activeIcon: Icon(Icons.star, color: _activeColor),
              label: l10n.roundingLabel),
          BottomNavigationBarItem(
              icon: Icon(Icons.golf_course, color: _defaultColor),
              activeIcon: Icon(Icons.golf_course, color: _activeColor),
              label: l10n.participationLabel),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chat_bubble, color: _defaultColor),
              activeIcon: Icon(CupertinoIcons.chat_bubble, color: _activeColor),
              label: l10n.messageLabel),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.profile_circled, color: _defaultColor),
              activeIcon:
                  Icon(CupertinoIcons.profile_circled, color: _activeColor),
              label: l10n.profileLabel),
        ],
      ),
    );
  }
}
