import 'dart:io';

import 'package:gtfs_binary_dart/gtfs_binary_dart.dart';
import 'package:gtfs_binary_dart/src/helpers/binary_reader.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';
import 'package:latlong2/latlong.dart';
import 'package:test/test.dart';

void main() {
  final file = BinaryFileReader(File('test/fixture/feed.gtb').openSync());
  final binary = GtfsBinary.read(file).withFile(file);

  test('Agencies', () {
    expect(binary.agencies.agencies, hasLength(1));
  });

  test('Stops are okay', () {
    expect(binary.stops.chunkStopCounts.fold(0, (a, b) => a + b), 7);
    final stop3 = binary.getStopByGtfsId('stop3');
    expect(stop3, isNotNull);
    expect(stop3!.gtfsId, 'stop3');
    expect(stop3.name, 'Stop 3');
    expect(stop3.code, '0010-03');
    expect(stop3.isStation, isFalse);
    expect(stop3.location, LatLng(41.8911, 12.4930));
    expect(stop3.wheelchair, Accessibility.A_NO);
    expect(stop3.routes, hasLength(1));
  });

  test('Stop lookups', () {
    final stops = binary.autocompleteStops('stop');
    expect(stops, hasLength(7));

    final stops2 = binary.findStopsForBounds(LatLng(41.89, 12.49), LatLng(41.8903, 12.49315));
    expect(stops2.map((s) => s.gtfsId).toSet(), {'stop1', 'stop2', 'stop5', 'stop6'});

    final stops3 = binary.findStopsAround(LatLng(41.8911, 12.4929), 30);
    expect(stops3.map((s) => s.gtfsId).toSet(), {'stop3', 'stop4'});
  });

  test('Routes and agencies are okay', () {
    final route = binary.getRouteByGtfsId('ROUTE2');
    expect(route, isNotNull);
    expect(route!.agency.name, 'Nonesuch Transit');
    expect(route.name, 'T1');
    expect(route.longName, 'another route');
    expect(route.type, RouteType.T_TRAM);
    expect(route.color, 0xBBEECC);
  });
}
