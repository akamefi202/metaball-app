enum DashboardScreenTab {
  home,
  rounding,
  play,
  message,
  profile,
}

extension DashboardScreenTabExtension on DashboardScreenTab {
  String get value {
    switch (this) {
      case DashboardScreenTab.home:
        return 'home';
      case DashboardScreenTab.rounding:
        return 'rounding';
      case DashboardScreenTab.play:
        return 'play';
      case DashboardScreenTab.message:
        return 'message';
      case DashboardScreenTab.profile:
        return 'profile';
    }
  }
}
