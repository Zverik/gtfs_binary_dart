import 'package:gtfs_binary_dart/src/helpers/just_time.dart';
import 'package:gtfs_binary_dart/src/models/itinerary.dart';
import 'package:gtfs_binary_dart/src/models/stop.dart';
import 'package:gtfs_binary_dart/src/models/trip.dart';
import 'package:gtfs_binary_dart/src/models/route.dart' as r;
import 'package:gtfs_binary_dart/src/models/trip_stop.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';
import 'package:latlong2/latlong.dart';

class RouteTrip {
  final String gtfsId;
  final int serviceId;
  final List<JustTime> departures;
  final bool approximate;
  final JustTime? endTime;
  final int? interval;
  final Accessibility wheelchair;
  final Accessibility bikes;

  RouteTrip({
    required this.gtfsId,
    required this.serviceId,
    required this.departures,
    required this.approximate,
    this.endTime,
    this.interval,
    this.wheelchair = Accessibility.A_UNKNOWN,
    this.bikes = Accessibility.A_UNKNOWN,
  });

  bool isDepartureBetween(int seqNo, JustTime earliest, JustTime latest) {
    final departure = departures[seqNo];
    if (interval == null) {
      return earliest <= departure && departure <= latest;
    } else {
      final lastDeparture = endTime!.plusSeconds(departure - departures[0]);
      return earliest <= lastDeparture && departure <= latest;
    }
  }

  Trip toTrip({
    required r.Route route,
    required UnpackedItinerary itinerary,
    required Map<int, Stop> stops,
    List<LatLng>? path,
    required DateTime date,
  }) => Trip(
    gtfsId: gtfsId,
    route: route,
    stops: itinerary.stopIds.indexed
        .map(
          (s) => TripStop.fromProto(
            stop: stops[s.$2]!,
            departure: departures[s.$1].toDateTime(date),
            itinerary: itinerary,
            headsigns: route.headsigns,
          ),
        )
        .toList(),
    path: path,
    wheelchair: wheelchair,
    bikes: bikes,
    approximate: approximate,
    frequencySeconds: approximate ? interval : null,
  );
}
