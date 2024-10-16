import 'package:metaball_app/environment/config.dart';
import 'package:metaball_app/utils/strings.dart';

String getStringFromStartDateTime(DateTime time) {
  return "${getStringFromStartDate(time)} ${getStringFromTime(time)}";
}

String getStringFromStartDate(DateTime time) {
  const jaWeekdays = ["月", "火", "水", "木", "金", "土", "日"];

  if (Config.fallbackLocale == 'ja') {
    return "${time.year}/${time.month.toString().padLeft(2, '0')}/${time.day.toString().padLeft(2, '0')}(${jaWeekdays[time.weekday - 1]})";
  } else {
    return "${time.year}/${time.month.toString().padLeft(2, '0')}/${time.day.toString().padLeft(2, '0')}";
  }
}

String getStringFromStartDateExceptYear(DateTime time) {
  const jaWeekdays = ["月", "火", "水", "木", "金", "土", "日"];

  if (Config.fallbackLocale == 'ja') {
    return "${time.month.toString().padLeft(2, '0')}/${time.day.toString().padLeft(2, '0')}(${jaWeekdays[time.weekday - 1]})";
  } else {
    return "${time.month.toString().padLeft(2, '0')}/${time.day.toString().padLeft(2, '0')}";
  }
}

String getBeforeDurationString(DateTime time) {
  final currentTime = DateTime.now();

  if (time.year != currentTime.year) {
    return "${currentTime.year - time.year}${Config.fallbackLocale == 'ja' ? "年前" : " Year(s) Ago"}";
  }
  if (time.month != currentTime.month) {
    return "${currentTime.month - time.month}${Config.fallbackLocale == 'ja' ? "か月前" : " Month(s) Ago"}";
  }
  if (time.day != currentTime.day) {
    return "${currentTime.day - time.day}${Config.fallbackLocale == 'ja' ? "日前" : " Day(s) Ago"}";
  }
  if (time.hour != currentTime.hour) {
    return "${currentTime.hour - time.hour}${Config.fallbackLocale == 'ja' ? "時間前" : " Hour(s) Ago"}";
  }

  return "${currentTime.minute - time.minute}${Config.fallbackLocale == 'ja' ? "分前" : " Minute(s) Ago"}";
}

bool compareDates(DateTime date1, DateTime date2) {
  if (date1.year == date2.year &&
      date1.month == date2.month &&
      date1.day == date2.day) {
    return true;
  }
  return false;
}
