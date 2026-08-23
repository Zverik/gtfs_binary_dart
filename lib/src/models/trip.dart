import 'package:gtfs_binary_dart/src/models/route.dart' as r;
import 'package:gtfs_binary_dart/src/models/trip_stop.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';
import 'package:latlong2/latlong.dart';

class Trip {
  final String gtfsId;
  final r.Route route;
  final List<LatLng>? path;
  final List<TripStop> stops;
  final Accessibility wheelchair;
  final Accessibility bikes;

  /// Whether some or all of stop times are approximate (not timepoints).
  final bool approximate;

  /// If not null, departure and arrival times in [stops] should be disregarded, and
  /// this interval should be used instead for every stop.
  final int? frequencySeconds;

  Trip({
    required this.gtfsId,
    required this.route,
    required this.path,
    required this.stops,
    required this.wheelchair,
    required this.bikes,
    required this.approximate,
    required this.frequencySeconds,
  });
}
