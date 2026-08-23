import 'dart:typed_data' show Uint8List;

import 'package:gtfs_binary_dart/src/helpers/binary_reader.dart';
import 'package:gtfs_binary_dart/src/helpers/decoder.dart';
import 'package:gtfs_binary_dart/src/helpers/just_time.dart';
import 'package:gtfs_binary_dart/src/helpers/packed_trie.dart';
import 'package:gtfs_binary_dart/src/models/route_trip.dart';
import 'package:gtfs_binary_dart/src/models/stop.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';
import 'package:gtfs_binary_dart/src/models/route.dart' as r;

class RouteQueries {
  final BinaryReader access;
  final Agencies agencies;
  final RouteMetadata routes;
  final int routesOffset;
  final PackedTrie? routeByGtfsId;

  RouteQueries({required this.access, required this.routes, required this.routesOffset, required this.agencies, this.routeByGtfsId});

  r.Route? findByGtfsId(String gtfsId) {
    if (routeByGtfsId == null) return null;
    final ids = routeByGtfsId!.find(gtfsId);
    return ids.isEmpty ? null : r.Route.fromProto(ids.first, getOriginalRouteById(ids.first), agencies);
  }

  Route getOriginalRouteById(int routeId) {
    int offset = routesOffset + routes.routeLengths.sublist(0, routeId).fold(0, (a, b) => a + b);
    return Route.fromBuffer(access.readSync(offset, routes.routeLengths[routeId]));
  }

  Map<int, Route> getOriginalRoutesForStops(Iterable<Stop> stops) {
    final routeIds = stops.expand((s) => s.routes).toSet();
    final result = <int, Route>{};
    int offset = routesOffset;
    for (final routeId in routes.routeLengths.indexed) {
      if (routeIds.contains(routeId.$1)) {
        result[routeId.$1] = Route.fromBuffer(access.readSync(offset, routeId.$2));
      }
      offset += routeId.$2.abs();
    }
    return result;
  }

  List<r.Route> getRoutesForStops(Iterable<Stop> stops) =>
      getOriginalRoutesForStops(stops).entries.map((e) => r.Route.fromProto(e.key, e.value, agencies)).toList();

  List<RouteTrip> readTrips(Itinerary itinerary, Route route) {
    final data = BinaryDecoder(Uint8List.fromList(itinerary.trips));
    final count = itinerary.serviceIds.length;
    final stops = itinerary.stopIds.length;
    final firstDepartures = data.readUintsDelta(count);
    final deltas = data.readSintsRle(count * (stops - 1));
    final gtfsIds = data.readStringsCommon(count);
    final approximates = data.read1Bit(count);
    final endTimes = route.hasFrequencies ? data.readUints(count) : <int>[];
    final intervals = route.hasFrequencies ? data.readUints(count) : <int>[];
    final wheelchairs = routes.hasWheelchairInfo ? data.read2Bit(count) : <int>[];
    final bikes = routes.hasBikeInfo ? data.read2Bit(count) : <int>[];

    final departures = firstDepartures.map((d) => [d]).toList();
    for (int tripId = 0; tripId < count; tripId++) {
      for (int stopId = 0; stopId < stops - 1; stopId++) {
        departures[tripId].add(
          deltas[stopId * count + tripId] + itinerary.departureDeltas[stopId] + departures[tripId].last,
        );
      }
    }

    return [
      for (int i = 0; i < count; i++)
        RouteTrip(
          gtfsId: gtfsIds[i],
          serviceId: itinerary.serviceIds[i],
          departures: departures[i].map((d) => JustTime.fromInt(d * 5)).toList(),
          endTime: endTimes.isEmpty || endTimes[i] == 0
              ? null
              : JustTime.fromInt((firstDepartures[i] + endTimes[i]) * 5),
          approximate: approximates[i],
          interval: intervals.isEmpty ? null : intervals[i],
          wheelchair: wheelchairs.isEmpty ? Accessibility.A_UNKNOWN : Accessibility.valueOf(wheelchairs[i])!,
          bikes: bikes.isEmpty ? Accessibility.A_UNKNOWN : Accessibility.valueOf(bikes[i])!,
        ),
    ];
  }
}
