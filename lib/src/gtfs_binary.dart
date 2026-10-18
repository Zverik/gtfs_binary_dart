import 'dart:io';

import 'package:fast_geohash/fast_geohash_int.dart';
import 'package:gtfs_binary_dart/src/helpers/binary_reader.dart';
import 'package:gtfs_binary_dart/src/helpers/equirectangular.dart';
import 'package:gtfs_binary_dart/src/helpers/just_date.dart';
import 'package:gtfs_binary_dart/src/helpers/just_time.dart';
import 'package:gtfs_binary_dart/src/helpers/packed_trie.dart';
import 'package:gtfs_binary_dart/src/models/schedule_item.dart';
import 'package:gtfs_binary_dart/src/models/departure.dart';
import 'package:gtfs_binary_dart/src/models/itinerary.dart';
import 'package:gtfs_binary_dart/src/models/route_trip.dart';
import 'package:gtfs_binary_dart/src/models/stop.dart';
import 'package:gtfs_binary_dart/src/models/route.dart' as r;
import 'package:gtfs_binary_dart/src/models/trip_stop.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';
import 'package:gtfs_binary_dart/src/queries/calendar.dart';
import 'package:gtfs_binary_dart/src/queries/routes.dart';
import 'package:gtfs_binary_dart/src/queries/shapes.dart';
import 'package:gtfs_binary_dart/src/queries/stops.dart';
import 'package:latlong2/latlong.dart';

class GtbFormatError extends IOException {
  final String _message;

  GtbFormatError(this._message);

  @override
  String toString() => 'GtbFormatError($_message)';
}

class FileNotAttachedException extends IOException {}

class GtfsBinary {
  final Footer footer;
  final Agencies agencies;
  final ShapeMetadata? shapes;
  final int? shapesOffset;
  final StopMetadata stops;
  final int stopsOffset;
  final PackedTrie? stopByName;
  final PackedTrie? stopByGtfsId;
  final PackedTrie? routeByGtfsId;
  final CalendarMetadata calendar;
  final int monthsOffset;
  final RouteMetadata routes;
  final int routesOffset;

  final BinaryReader? access;
  final StopQueries? stopQueries;
  final CalendarQueries? calendarQueries;
  final RouteQueries? routeQueries;
  final ShapeQueries? shapeQueries;

  GtfsBinary({
    required this.footer,
    required this.agencies,
    this.shapes,
    this.shapesOffset,
    required this.stops,
    required this.stopsOffset,
    this.stopByName,
    this.stopByGtfsId,
    this.routeByGtfsId,
    required this.calendar,
    required this.monthsOffset,
    required this.routes,
    required this.routesOffset,
    this.access,
  }) : stopQueries = access == null
           ? null
           : StopQueries(
               access: access,
               stops: stops,
               stopsOffset: stopsOffset,
               stopByName: stopByName,
               stopByGtfsId: stopByGtfsId,
             ),
       calendarQueries = access == null
           ? null
           : CalendarQueries(access: access, monthsOffset: monthsOffset, calendar: calendar),
       routeQueries = access == null
           ? null
           : RouteQueries(
               access: access,
               routesOffset: routesOffset,
               routes: routes,
               agencies: agencies,
               routeByGtfsId: routeByGtfsId,
             ),
       shapeQueries = access == null || shapes == null || shapesOffset == null
           ? null
           : ShapeQueries(access: access, shapesOffset: shapesOffset, shapes: shapes);

  GtfsBinary withFile(BinaryReader reader) => GtfsBinary(
    footer: footer,
    agencies: agencies,
    shapes: shapes,
    shapesOffset: shapesOffset,
    stops: stops,
    stopsOffset: stopsOffset,
    stopByName: stopByName,
    stopByGtfsId: stopByGtfsId,
    routeByGtfsId: routeByGtfsId,
    calendar: calendar,
    monthsOffset: monthsOffset,
    routes: routes,
    routesOffset: routesOffset,
    access: reader.setCompressed(footer.compressed),
  );

  /// Reads the GTFS Binary file metadata instantiating the structures in memory.
  /// Given it does a lot, better call it in an isolate. Do not forget to call [withFile] after.
  static GtfsBinary read(BinaryReader access) {
    final signature = access.read(0, 4);
    final hexSign = signature.toList().map((v) => v.toRadixString(16).padLeft(2, '0')).join();
    if (hexSign != '4754420a') {
      throw GtbFormatError('Incorrect header, expected "GTB\\n": $hexSign');
    }

    final footerLenBytes = access.read(-2, 2);
    final footerLen = (footerLenBytes[0] << 8) + footerLenBytes[1];
    final footer = Footer.fromBuffer(access.read(-2 - footerLen, footerLen));

    final blocks = {for (final block in footer.blocks) block.block: block};
    final agencies = Agencies.fromBuffer(access.readBlock(blocks[Block.B_AGENCIES]!));
    final shapes = blocks.containsKey(Block.B_SHAPES)
        ? ShapeMetadata.fromBuffer(access.readBlock(blocks[Block.B_SHAPES]!))
        : null;
    final stops = StopMetadata.fromBuffer(access.readBlock(blocks[Block.B_STOPS]!));
    final lookup = blocks.containsKey(Block.B_LOOKUP)
        ? LookupMetadata.fromBuffer(access.readBlock(blocks[Block.B_LOOKUP]!))
        : null;
    final calendar = CalendarMetadata.fromBuffer(access.readBlock(blocks[Block.B_CALENDAR]!));
    final routes = RouteMetadata.fromBuffer(access.readBlock(blocks[Block.B_ROUTES]!));

    return GtfsBinary(
      footer: footer,
      agencies: agencies,
      shapes: shapes,
      shapesOffset: shapes == null ? null : (blocks[Block.B_SHAPES]!.offset + blocks[Block.B_SHAPES]!.length).toInt(),
      stops: stops,
      stopsOffset: (blocks[Block.B_STOPS]!.offset + blocks[Block.B_STOPS]!.length).toInt(),
      stopByName: lookup == null ? null : PackedTrie(lookup.stopByName),
      stopByGtfsId: lookup == null ? null : PackedTrie(lookup.stopByGtfsId),
      routeByGtfsId: lookup == null ? null : PackedTrie(lookup.routeByGtfsId),
      calendar: calendar,
      monthsOffset: (blocks[Block.B_CALENDAR]!.offset + blocks[Block.B_CALENDAR]!.length).toInt(),
      routes: routes,
      routesOffset: (blocks[Block.B_ROUTES]!.offset + blocks[Block.B_ROUTES]!.length).toInt(),
    );
  }

  List<Stop> getStopsById(Iterable<int> stopIdSrc) {
    if (stopQueries == null) throw FileNotAttachedException();
    return stopQueries!.getStopsById(stopIdSrc);
  }

  Stop? getStopByGtfsId(String gtfsId) {
    if (stopQueries == null) throw FileNotAttachedException();
    return stopQueries!.findByGtfsId(gtfsId);
  }

  r.Route? getRouteByGtfsId(String gtfsId) {
    if (routeQueries == null) throw FileNotAttachedException();
    return routeQueries!.findByGtfsId(gtfsId);
  }

  List<Stop> autocompleteStops(String query) {
    if (stopQueries == null) throw FileNotAttachedException();
    return stopQueries!.autocompleteStops(query);
  }

  List<Stop> findStopsAround(LatLng center, double radiusMeters) {
    if (stopQueries == null) throw FileNotAttachedException();
    final hashes = geohash.forCircle(center.latitude, center.longitude, radiusMeters, StopQueries.kGeohashPrecision);
    final allStops = stopQueries!.findStopsForGeohashes(hashes);
    final distance = DistanceEquirectangular();
    return allStops.where((s) => distance(center, s.location) <= radiusMeters).toList();
  }

  List<Stop> findStopsForBounds(LatLng southWest, LatLng northEast) {
    if (stopQueries == null) throw FileNotAttachedException();
    final hashes = geohash.forBounds(
      southWest.latitude,
      southWest.longitude,
      northEast.latitude,
      northEast.longitude,
      StopQueries.kGeohashPrecision,
    );
    final allStops = stopQueries!.findStopsForGeohashes(hashes);
    return allStops
        .where(
          (s) =>
              s.location.latitude >= southWest.latitude &&
              s.location.latitude <= northEast.latitude &&
              s.location.longitude >= southWest.longitude &&
              s.location.longitude <= northEast.longitude,
        )
        .toList();
  }

  List<r.Route> getRoutesForStop(Stop stop) {
    if (access == null) throw FileNotAttachedException();
    return routeQueries!.getRoutesForStops([stop]);
  }

  List<Departure> findDepartures({required Stop stop, DateTime? now, int pastSeconds = 0, int futureSeconds = 3600}) {
    if (access == null) throw FileNotAttachedException();
    now ??= DateTime.now();
    final date = JustDate.fromDateTime(now);
    final services = calendarQueries!.servicesForDate(date);
    final earliest = JustTime.fromDateTime(now).minusSeconds(pastSeconds);
    final latest = JustTime.fromDateTime(now).plusSeconds(futureSeconds);
    final routes = routeQueries!.getOriginalRoutesForStops([stop]);

    final shapeCache = <int, List<LatLng>?>{};
    final stopCache = <int, Stop>{stop.feedId: stop};
    final departures = <Departure>[];

    // Find and decode itineraries that have the stop.
    for (final routeElement in routes.entries) {
      final route = routeElement.value;
      final ourRoute = r.Route.fromProto(routeElement.key, route, agencies);
      for (final itinerary in route.itineraries) {
        final sequenceId = itinerary.stopIds.indexOf(stop.feedId);
        if (sequenceId < 0) continue;
        if (!itinerary.serviceIds.toSet().any((serviceId) => services.contains(serviceId))) continue;

        // We have itineraries with the given stop and trips on the day, time to decode.
        final allTrips = routeQueries!.readTrips(itinerary, route);

        // Filter trips that definitely fit.
        final trips = <RouteTrip>[];
        for (final trip in allTrips) {
          if (!services.contains(trip.serviceId)) continue;
          if (trip.isDepartureBetween(sequenceId, earliest, latest)) trips.add(trip);
        }

        if (trips.isEmpty) continue;

        // Read the shape and the missing stops.
        if (itinerary.shapeId > 0 && !shapeCache.containsKey(itinerary.shapeId)) {
          shapeCache[itinerary.shapeId] = shapeQueries?.getShapeById(itinerary.shapeId - 1);
        }
        final stops = stopQueries!.getStopsById(itinerary.stopIds.toSet().difference(stopCache.keys.toSet()));
        stopCache.addEntries(stops.map((stop) => MapEntry(stop.feedId, stop)));

        final unpItinerary = UnpackedItinerary(itinerary);
        for (final trip in trips) {
          if (trip.interval != null && !trip.approximate) {
            JustTime current = trip.departures[sequenceId];
            while (current <= trip.endTime! && current <= latest) {
              if (current >= earliest) {
                departures.add(
                  Departure(
                    trip.toTrip(
                      route: ourRoute,
                      itinerary: unpItinerary,
                      stops: stopCache,
                      path: shapeCache[itinerary.shapeId],
                      date: now,
                    ),
                    stop,
                  ),
                );
              }
              current = current.plusSeconds(trip.interval!);
            }
          } else {
            departures.add(
              Departure(
                trip.toTrip(
                  route: ourRoute,
                  itinerary: unpItinerary,
                  stops: stopCache,
                  path: shapeCache[itinerary.shapeId],
                  date: now,
                ),
                stop,
              ),
            );
          }
        }
      }
    }

    departures.sort();
    return departures;
  }

  List<ScheduleItem> findDeparturesForDay(r.Route ourRoute, Stop stop, JustDate date) {
    if (access == null) throw FileNotAttachedException();
    final services = calendarQueries!.servicesForDate(date);
    final route = routeQueries!.getOriginalRouteById(ourRoute.feedId);
    final result = <ScheduleItem>[];
    for (final itinerary in route.itineraries) {
      final sequenceId = itinerary.stopIds.indexOf(stop.feedId);
      if (sequenceId < 0) continue;
      if (!itinerary.serviceIds.any((serviceId) => services.contains(serviceId))) continue;

      // We have itineraries with the given stop and trips on the day, time to decode.
      final unpItinerary = UnpackedItinerary(itinerary);
      final allTrips = routeQueries!.readTrips(itinerary, route);
      for (final trip in allTrips) {
        if (!services.contains(trip.serviceId)) continue;
        final tripStop = TripStop.fromProto(
          stop: stop,
          headsigns: route.headsigns,
          itinerary: unpItinerary,
          departure: DateTime.now(),
        );
        if (trip.interval != null && trip.approximate) {
          // Frequency-based trip, we add it unconditionally.
          result.add(ScheduleItem.frequencyFromTrip(tripStop, trip));
        } else {
          final departure = trip.departures[sequenceId];
          if (trip.interval == null) {
            // Just one arrival, add it.
            result.add(ScheduleItem.departureFromTrip(departure, tripStop, trip));
          } else {
            // Not approximate: add all arrivals.
            int after = departure - trip.departures.first;
            JustTime current = trip.departures.first;
            while (current <= trip.endTime!) {
              result.add(ScheduleItem.departureFromTrip(current.plusSeconds(after), tripStop, trip));
              current = current.plusSeconds(trip.interval!);
            }
          }
        }
      }
    }
    result.sort();
    return result;
  }
}
