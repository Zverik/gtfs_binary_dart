import 'package:gtfs_binary_dart/src/helpers/binary_reader.dart';
import 'package:gtfs_binary_dart/src/helpers/just_date.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';

class CalendarQueries {
  final Map<JustDate, Set<int>> _servicesCache = {};
  final BinaryReader access;
  final CalendarMetadata calendar;
  final int monthsOffset;

  CalendarQueries({required this.access, required this.calendar, required this.monthsOffset});

  Set<int> servicesForDate(JustDate date) {
    final present = _servicesCache[date];
    if (present != null) return present;

    final dowMask = 1 << date.weekday;
    final baseDate = JustDate(
      2000 + (calendar.baseDate / 10000).floor(),
      ((calendar.baseDate % 10000) / 100).floor(),
      calendar.baseDate % 100,
    );
    if (baseDate > date) return {}; // nothing we can do

    JustDate startDate = baseDate;
    final result = <int>{};
    for (int i = 0; i < calendar.startDates.length; i++) {
      startDate = startDate.plusDays(calendar.startDates[i]);
      if (date < startDate) continue;
      if (date > startDate.plusDays(calendar.endDates[i])) continue;
      if (calendar.weekdays[i] & dowMask == 0) continue;
      result.add(i);
    }

    final int fromBase = date - baseDate;
    final chunk = (fromBase / calendar.daysInMonth).floor();
    int offset = monthsOffset;
    for (int i = 0; i < chunk; i++) offset += calendar.monthLengths[i].abs();

    final bytes = access.read(offset, calendar.monthLengths[chunk]);
    final month = CalendarMonth.fromBuffer(bytes);
    int currentDate = chunk * calendar.daysInMonth;
    int dayInMonth = -1;
    while (currentDate < fromBase) {
      if (dayInMonth < 0) {
        currentDate += month.dateOffsets.isEmpty ? 0 : month.dateOffsets[0];
      } else {
        currentDate += dayInMonth >= month.dateOffsets.length ? 1 : month.dateOffsets[dayInMonth];
      }
      dayInMonth++;
    }
    if (currentDate == fromBase && dayInMonth < month.dates.length) {
      result.addAll(_deltaUncode(month.dates[dayInMonth].includedIn));
      result.removeAll(_deltaUncode(month.dates[dayInMonth].exceptionIn));
    }

    _servicesCache[date] = result;
    return result;
  }

  List<int> _deltaUncode(List<int> values) {
    final result = <int>[];
    for (final v in values) result.add(result.isEmpty ? v : v + result.last);
    return result;
  }
}
