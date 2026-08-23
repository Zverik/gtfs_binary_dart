import 'dart:io';

import 'package:gtfs_binary_dart/gtfs_binary_dart.dart';
import 'package:gtfs_binary_dart/src/helpers/just_date.dart';
import 'package:gtfs_binary_dart/src/helpers/just_time.dart';
import 'package:gtfs_binary_dart/src/models/schedule_item.dart';
import 'package:test/test.dart';

void main() {
  final file = File('test/fixture/feed.gtb');
  final binary = GtfsBinary.read(file).withFile(file);
  final stops = {for (final stop in binary.autocompleteStops('stop')) stop.gtfsId: stop};

  test('Schedule for a regular route', () {
    final bus = binary.getRouteByGtfsId('ROUTE1');
    expect(bus, isNotNull);
    final deps1 = binary.findDeparturesForDay(bus!, stops['stop1']!, JustDate(2026, 6, 26));
    expect(deps1, isEmpty, reason: 'no service on workdays');

    final deps2 = binary.findDeparturesForDay(bus, stops['stop1']!, JustDate(2026, 6, 27));
    expect(deps2.map((d) => d.departure), [
      JustTime(10, 0, 30),
      JustTime(10, 50, 30),
      JustTime(11, 0, 30),
      JustTime(11, 50, 30),
    ]);

    final deps3 = binary.findDeparturesForDay(bus, stops['stop4']!, JustDate(2026, 6, 23));
    expect(deps3.map((d) => d.departure), [
      JustTime(10, 20),
      JustTime(10, 30),
      JustTime(11, 20),
      JustTime(11, 30),
      JustTime(12, 20),
    ]);
  });

  test('Schedule for a frequency-based route', () {
    final tram = binary.getRouteByGtfsId('ROUTE2');
    expect(tram, isNotNull);
    final deps1 = binary.findDeparturesForDay(tram!, stops['stop5']!, JustDate(2026, 6, 27));
    expect(deps1, hasLength((19 - 12) * 3 + 1));
    expect(deps1[1].departure, JustTime(12, 20));
    expect(deps1.last.departure, JustTime(19, 0));

    final deps2 = binary.findDeparturesForDay(tram, stops['stop5']!, JustDate(2026, 6, 26));
    expect(deps2, hasLength(2));
    expect(deps2.first.frequency, Frequency(JustTime(12, 0), JustTime(19, 0), 1200));
  });

  test('Arrivals for a time', () {
    final ar = binary.findDepartures(stop: stops['stop2']!, now: DateTime(2026, 6, 27, 11, 6, 0));
    expect(ar, hasLength(2));
    expect(ar.map((a) => a.stop.stop.name).toSet(), {'Stop 2'});
    expect(ar.map((a) => a.trip.route.name), ['B1', 'B1']);
    expect(ar.map((a) => a.trip.gtfsId), ['bus3', 'bus4']);
    expect(ar.map((a) => a.stop.departure), [DateTime(2026, 6, 27, 11, 10), DateTime(2026, 6, 27, 11, 40)]);
  });

  test('Arrivals for a frequency', () {
    final ar2 = binary.findDepartures(stop: stops['stop7']!, now: DateTime(2026, 6, 26, 10, 6, 0));
    expect(ar2, isEmpty);

    final ar3 = binary.findDepartures(stop: stops['stop7']!, now: DateTime(2026, 6, 26, 11, 36, 0));
    expect(ar3, hasLength(1));
    expect(ar3.first.trip.frequencySeconds, 1200);
    expect(ar3.first.interval, isTrue);

    final ar4 = binary.findDepartures(stop: stops['stop7']!, now: DateTime(2026, 6, 26, 14, 6, 0));
    expect(ar4, hasLength(2));
    expect(ar4.map((a) => a.trip.frequencySeconds), [1200, 1200]);
    expect(ar4.map((a) => a.interval), [true, true]);

    // TODO this
    // final ar5 = binary.findDepartures(stop: stops['stop7']!, now: DateTime(2026, 6, 27, 14, 6, 0));
    // expect(ar5, hasLength(3));
    // expect(ar5.first.interval, isFalse);
    // expect(ar5.map((a) => a.stop.departure), [
    //   DateTime(2026, 6, 27, 14, 20),
    //   DateTime(2026, 6, 27, 14, 40),
    //   DateTime(2026, 6, 27, 15, 0),
    // ]);
  });
}