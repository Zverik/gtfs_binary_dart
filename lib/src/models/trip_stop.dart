import 'package:gtfs_binary_dart/src/helpers/null_if_empty.dart';
import 'package:gtfs_binary_dart/src/models/itinerary.dart';
import 'package:gtfs_binary_dart/src/models/stop.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';

class TripStop {
  final Stop stop;
  final String? headsign;
  final DateTime departure;
  final PickupDropoff pickup;
  final PickupDropoff dropoff;

  TripStop({
    required this.stop,
    required this.headsign,
    required this.departure,
    required this.pickup,
    required this.dropoff,
  });

  factory TripStop.fromProto({
    required Stop stop,
    required DateTime departure,
    required UnpackedItinerary itinerary,
    List<String> headsigns = const [],
  }) {
    final sequenceId = itinerary.stopIds.indexOf(stop.feedId);
    return TripStop(
      stop: stop,
      departure: departure,
      headsign: headsigns[itinerary.headsigns[sequenceId]].nullIfEmpty,
      pickup: itinerary.pickupTypes.elementAtOrNull(sequenceId) ?? PickupDropoff.PD_YES,
      dropoff: itinerary.dropoffTypes.elementAtOrNull(sequenceId) ?? PickupDropoff.PD_YES,
    );
  }

  @override
  String toString() => 'TripStop(stop=${stop.name}, headsign=$headsign, departure=$departure)';
}
