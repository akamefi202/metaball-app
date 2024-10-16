import 'package:collection/collection.dart';
import 'package:go_router/go_router.dart';
import 'package:metaball_app/modules/blog/screens/blog_list_screen.dart';
import 'package:metaball_app/modules/blog/screens/blog_screen.dart';
import 'package:metaball_app/modules/blog/screens/create_blog_screen.dart';
import 'package:metaball_app/modules/blog/screens/feedback_list_screen.dart';
import 'package:metaball_app/modules/club/screens/club_list_screen.dart';
import 'package:metaball_app/modules/club/screens/club_member_list_screen.dart';
import 'package:metaball_app/modules/club/screens/club_member_recruit_filter_screen.dart';
import 'package:metaball_app/modules/club/screens/club_member_recruit_screen.dart';
import 'package:metaball_app/modules/club/screens/club_member_remove_screen.dart';
import 'package:metaball_app/modules/club/screens/club_screen.dart';
import 'package:metaball_app/modules/club/screens/club_settings_screen.dart';
import 'package:metaball_app/modules/club/screens/create_club_screen.dart';
import 'package:metaball_app/modules/club/screens/my_club_list_screen.dart';
import 'package:metaball_app/modules/dashboard/enums/dashboard_screen_tab.dart';
import 'package:metaball_app/modules/dashboard/screens/dashboard_screen.dart';
import 'package:metaball_app/modules/message/screens/chatting_screen.dart';
import 'package:metaball_app/modules/profile/screens/account_inform_screen.dart';
import 'package:metaball_app/modules/profile/screens/connection_screen.dart';
import 'package:metaball_app/modules/profile/screens/edit_profile_screen.dart';
import 'package:metaball_app/modules/profile/screens/news_list_screen.dart';
import 'package:metaball_app/modules/profile/screens/news_screen.dart';
import 'package:metaball_app/modules/rounding/screens/member_screen.dart';
import 'package:metaball_app/modules/rounding/screens/round_list_filter_screen.dart';
import 'package:metaball_app/modules/rounding/screens/round_list_screen.dart';
import 'package:metaball_app/modules/rounding/screens/round_recruit_filter_screen.dart';
import 'package:metaball_app/modules/rounding/screens/round_recruit_screen.dart';
import 'package:metaball_app/modules/rounding/screens/round_requester_list_screen.dart';
import 'package:metaball_app/modules/rounding/screens/round_screen.dart';

enum RouteKey {
  dashboard,
  round,
  roundList,
  roundListFilter,
  roundRecruit,
  roundRecruitFilter,
  roundRequesterList,
  member,
  blogList,
  blog,
  createBlog,
  connection,
  myClub,
  clubList,
  club,
  clubSettings,
  clubMemberList,
  clubMemberRecruit,
  clubMemberRecruitFilter,
  clubMemberRemove,
  createClub,
  feedbackList,
  accountInform,
  newsList,
  news,
  chatting,
  editProfile,
}

extension RouteName on RouteKey {
  static const Map<RouteKey, String> _routes = {
    RouteKey.dashboard: 'dashboard',
    RouteKey.round: 'round',
    RouteKey.roundList: 'round-list',
    RouteKey.roundListFilter: 'round-list-filter',
    RouteKey.roundRecruit: 'round-recruit',
    RouteKey.roundRecruitFilter: 'round-recruit-filter',
    RouteKey.roundRequesterList: 'round/requester-list',
    RouteKey.member: 'member',
    RouteKey.blogList: 'blog-list',
    RouteKey.blog: 'blog',
    RouteKey.createBlog: 'create-blog',
    RouteKey.connection: 'connection',
    RouteKey.myClub: 'my-club',
    RouteKey.clubList: 'club-list',
    RouteKey.club: 'club',
    RouteKey.createClub: 'create-club',
    RouteKey.clubMemberList: 'club-member-list',
    RouteKey.clubMemberRecruit: 'club-member-recruit',
    RouteKey.clubMemberRecruitFilter: 'club-member-recruit-filter',
    RouteKey.clubMemberRemove: 'club-member-remove',
    RouteKey.clubSettings: 'club-settings',
    RouteKey.feedbackList: 'feedback-list',
    RouteKey.accountInform: 'account-inform',
    RouteKey.newsList: 'news-list',
    RouteKey.news: 'news',
    RouteKey.chatting: 'chatting',
    RouteKey.editProfile: 'editProfile',
  };

  String get routePath {
    return _routes[this] ?? 'dashboard';
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
            path: RouteKey.dashboard.routePath,
            builder: (context, state) {
              return const DashboardScreen();
            },
          ),
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
            path: '${RouteKey.round.routePath}/:id',
            builder: (context, state) {
              return RoundScreen(id: state.pathParameters['id']);
            },
          ),
          GoRoute(
            path: RouteKey.roundList.routePath,
            builder: (context, state) {
              return const RoundListScreen();
            },
          ),
          GoRoute(
            path: RouteKey.roundListFilter.routePath,
            builder: (context, state) {
              return const RoundListFilterScreen();
            },
          ),
          GoRoute(
            path: '${RouteKey.roundRecruit.routePath}/:roundId',
            builder: (context, state) {
              return RoundRecruitScreen(
                  roundId: state.pathParameters['roundId']);
            },
          ),
          GoRoute(
            path: RouteKey.roundRecruitFilter.routePath,
            builder: (context, state) {
              return const RoundRecruitFilterScreen();
            },
          ),
          GoRoute(
            path: '${RouteKey.roundRequesterList.routePath}/:roundId',
            builder: (context, state) {
              return RoundRequesterListScreen(
                  roundId: state.pathParameters['roundId']);
            },
          ),
          GoRoute(
            path: '${RouteKey.member.routePath}/:id',
            builder: (context, state) {
              return MemberScreen(id: state.pathParameters['id']);
            },
          ),
          GoRoute(
            path: RouteKey.blogList.routePath,
            builder: (context, state) {
              return const BlogListScreen();
            },
          ),
          GoRoute(
            path: '${RouteKey.blog.routePath}/:id',
            builder: (context, state) {
              return BlogScreen(id: state.pathParameters['id']);
            },
          ),
          GoRoute(
            path: RouteKey.createBlog.routePath,
            builder: (context, state) {
              return const CreateBlogScreen();
            },
          ),
          GoRoute(
            path: RouteKey.connection.routePath,
            builder: (context, state) {
              return const ConnectionScreen();
            },
          ),
          GoRoute(
            path: RouteKey.myClub.routePath,
            builder: (context, state) {
              return const MyClubListScreen();
            },
          ),
          GoRoute(
            path: RouteKey.clubList.routePath,
            builder: (context, state) {
              return const ClubListScreen();
            },
          ),
          GoRoute(
            path: '${RouteKey.club.routePath}/:id',
            builder: (context, state) {
              return ClubScreen(id: state.pathParameters['id']);
            },
          ),
          GoRoute(
            path: RouteKey.createClub.routePath,
            builder: (context, state) {
              return const CreateClubScreen();
            },
          ),
          GoRoute(
            path: '${RouteKey.clubMemberList.routePath}/:clubId',
            builder: (context, state) {
              return ClubMemberListScreen(
                  clubId: state.pathParameters['clubId']);
            },
          ),
          GoRoute(
            path: '${RouteKey.clubMemberRecruit.routePath}/:clubId',
            builder: (context, state) {
              return ClubMemberRecruitScreen(
                  clubId: state.pathParameters['clubId']);
            },
          ),
          GoRoute(
            path: RouteKey.clubMemberRecruitFilter.routePath,
            builder: (context, state) {
              return const ClubMemberRecruitFilterScreen();
            },
          ),
          GoRoute(
            path: '${RouteKey.clubMemberRemove.routePath}/:clubId',
            builder: (context, state) {
              return ClubMemberRemoveScreen(
                  clubId: state.pathParameters['clubId']);
            },
          ),
          GoRoute(
            path: '${RouteKey.clubSettings.routePath}/:id',
            builder: (context, state) {
              return ClubSettingsScreen(id: state.pathParameters['id']);
            },
          ),
          GoRoute(
            path: '${RouteKey.feedbackList.routePath}/:blogId',
            builder: (context, state) {
              return FeedbackListScreen(blogId: state.pathParameters['blogId']);
            },
          ),
          GoRoute(
            path: RouteKey.accountInform.routePath,
            builder: (context, state) {
              return const AccountInformScreen();
            },
          ),
          GoRoute(
            path: RouteKey.newsList.routePath,
            builder: (context, state) {
              return const NewsListScreen();
            },
          ),
          GoRoute(
            path: '${RouteKey.news.routePath}/:id',
            builder: (context, state) {
              return NewsScreen(id: state.pathParameters['id']);
            },
          ),
          GoRoute(
            path: RouteKey.chatting.routePath,
            builder: (context, state) {
              return const ChattingScreen();
            },
          ),
          GoRoute(
            path: RouteKey.editProfile.routePath,
            builder: (context, state) {
              return const EditProfileScreen();
            },
          ),
        ],
      ),
    ],
  );
}
