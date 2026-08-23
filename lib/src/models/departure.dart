import 'package:gtfs_binary_dart/src/models/stop.dart';
import 'package:gtfs_binary_dart/src/models/trip.dart';
import 'package:gtfs_binary_dart/src/models/trip_stop.dart';

/// A [Trip] wrapper highlighting one specific stop.
class Departure implements Comparable<Departure> {
  final Trip trip;
  final TripStop stop;
  final bool interval;

  Departure(this.trip, Stop stop)
      : stop = trip.stops.firstWhere((s) => s.stop.feedId == stop.feedId),
        interval = trip.frequencySeconds != null;

  bool shouldDisregardTime() => trip.frequencySeconds != null;

  @override
  int compareTo(Departure other) {
    if (interval) return other.interval ? trip.frequencySeconds!.compareTo(other.trip.frequencySeconds!) : -1;
    if (other.interval) return 1;
    return stop.departure.compareTo(other.stop.departure);
  }

  @override
  String toString() => 'Departure(trip "${trip.gtfsId}", stop "${stop.stop.gtfsId}")';
}
