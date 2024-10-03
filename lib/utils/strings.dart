String getStringFromDate(DateTime datetime) {
  return '${datetime.year.toString().padLeft(4, '0')}/${datetime.month.toString().padLeft(2, '0')}/${datetime.day.toString().padLeft(2, '0')}';
}

String getStringFromTime(DateTime datetime) {
  return '${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}';
}

String getStringFromDateTime(DateTime datetime) {
  return '${datetime.year.toString().padLeft(4, '0')}/${datetime.month.toString().padLeft(2, '0')}/${datetime.day.toString().padLeft(2, '0')} ${datetime.hour.toString().padLeft(2, '0')}:${datetime.minute.toString().padLeft(2, '0')}:${datetime.second.toString().padLeft(2, '0')}';
}

String getHexFromByteArray(List<int> byteArray) {
  String result = "";
  for (var b in byteArray) {
    result += b.toRadixString(16).padLeft(2, '0');
    result += "-";
  }

  if (result.isNotEmpty) {
    result = result.substring(0, result.length - 1);
  }

  return result;
}
