import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/utils/strings.dart';

String getStringFromStartDateTime(DateTime time) {
  return "${getStringFromStartDate(time)} ${getStringFromTime(time)}";
}

String getStringFromStartDate(DateTime time) {
  const jaWeekdays = ["月", "火", "水", "木", "金", "土", "日"];

  if (Config.fallbackLocale == 'ja') {
    return "${time.month}/${time.day}(${jaWeekdays[time.weekday - 1]})";
  } else {
    return "${time.month}/${time.day}";
  }
}
