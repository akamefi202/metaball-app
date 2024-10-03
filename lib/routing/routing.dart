import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/l10n/l10n.dart';
import 'package:metaball_app/modules/dashboard/screens/dashboard_screen.dart';
import 'package:metaball_app/modules/home/screens/home_screen.dart';
import 'package:metaball_app/modules/rounding/screens/member_screen.dart';
import 'package:metaball_app/modules/rounding/screens/round_requester_list_screen.dart';
import 'package:metaball_app/modules/rounding/screens/rounding_screen.dart';
import 'package:metaball_app/modules/play/screens/play_screen.dart';
import 'package:metaball_app/modules/message/screens/message_screen.dart';
import 'package:metaball_app/modules/profile/screens/profile_screen.dart';

enum RouteKey {
  dashboard,
  roundRequesterList,
  member,
}

extension RouteName on RouteKey {
  static const Map<RouteKey, String> _routes = {
    RouteKey.dashboard: 'dashboard',
    RouteKey.roundRequesterList: 'round/requester-list',
    RouteKey.member: 'member',
  };

  String get routePath {
    return _routes[this] ?? 'dashboard/home';
  }

  String get location {
    return '/$routePath';
  }
}

class Routes {
  static List<String> unauthorizedRoutes = [];

  static bool isUnauthorizedPath(String path) {
    final route = Routes.unauthorizedRoutes.firstWhereOrNull((element) {
      return path.startsWith(element);
    });

    return route != null;
  }

  static bool isAuthorizedPath(String path) {
    return !Routes.isAuthorizedPath(path);
  }

  static GoRouter router = GoRouter(
    initialLocation: RouteKey.dashboard.location,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const DashboardScreen();
        },
        routes: [
          GoRoute(
            path: '${RouteKey.dashboard.routePath}/:tab',
            builder: (context, state) {
              String tabName = state.pathParameters['tab'] as String;
              DashboardScreenTab tab = DashboardScreenTab.values
                  .firstWhere((e) => e.value == tabName);
              return DashboardScreen(tab: tab);
            },
          ),
          GoRoute(
            path: '${RouteKey.roundRequesterList.routePath}/:id',
            builder: (context, state) {
              return RoundRequesterListScreen(id: state.pathParameters['id']);
            },
          ),
          GoRoute(
            path: '${RouteKey.member.routePath}/:id',
            builder: (context, state) {
              return MemberScreen(id: state.pathParameters['id']);
            },
          ),
        ],
      ),
    ],
  );
}
