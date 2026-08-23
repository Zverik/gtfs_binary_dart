import 'package:gtfs_binary_dart/src/helpers/just_time.dart';
import 'package:gtfs_binary_dart/src/models/route_trip.dart';
import 'package:gtfs_binary_dart/src/models/trip_stop.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';


/// A line in the day schedule for a route. Can have only one of the fields:
/// either [departure] with a fixed departure time, or [frequency] with an interval for a time range.
///
/// It also contains some stop and trip attributes from respective objects.
class ScheduleItem implements Comparable<ScheduleItem> {
  final JustTime? departure;
  final Frequency? frequency;

  final PickupDropoff pickup;
  final PickupDropoff dropoff;
  final Accessibility wheelchair;
  final Accessibility bikes;
  final String? headsign;

  ScheduleItem({
    this.departure,
    this.frequency,
    required this.pickup,
    required this.dropoff,
    required this.wheelchair,
    required this.bikes,
    this.headsign,
  });

  factory ScheduleItem.frequencyFromTrip(TripStop stop, RouteTrip trip) => ScheduleItem(
    frequency: Frequency.fromTrip(trip),
    pickup: stop.pickup,
    dropoff: stop.dropoff,
    wheelchair: trip.wheelchair,
    bikes: trip.bikes,
    headsign: stop.headsign,
  );

  factory ScheduleItem.departureFromTrip(JustTime departure, TripStop stop, RouteTrip trip) => ScheduleItem(
    departure: departure,
    pickup: stop.pickup,
    dropoff: stop.dropoff,
    wheelchair: trip.wheelchair,
    bikes: trip.bikes,
    headsign: stop.headsign,
  );

  @override
  int compareTo(ScheduleItem other) =>
      (departure ?? frequency!.start).compareTo(other.departure ?? other.frequency!.start);

  @override
  String toString() =>
      'ScheduleItem(${departure ?? frequency}, p=${pickup.name}, d=${dropoff.name}, w=${wheelchair.name}, b=${bikes.name})';
}

/// A time range and an interval for a frequency-based trip. Mirrors the same
/// three fields from the [Trip] class.
class Frequency {
  final JustTime start;
  final JustTime end;
  final int intervalSec;

  Frequency(this.start, this.end, this.intervalSec);

  factory Frequency.fromTrip(RouteTrip trip) => Frequency(trip.departures[0], trip.endTime!, trip.interval!);

  @override
  bool operator ==(Object other) =>
      other is Frequency && other.start == start && other.end == end && other.intervalSec == intervalSec;

  @override
  int get hashCode => Object.hash(start, end, intervalSec);

  @override
  String toString() => 'Frequency($start, $end, $intervalSec)';
}
