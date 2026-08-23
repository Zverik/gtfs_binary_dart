import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';
import 'package:latlong2/latlong.dart';

class Stop {
  final int feedId;
  final String gtfsId;
  final String code;
  final String name;
  final String desc;
  final LatLng location;
  final Accessibility wheelchair;
  final bool isStation;
  final Stop? parent;
  final List<int> routes;

  const Stop({
    required this.feedId,
    required this.gtfsId,
    required this.code,
    required this.name,
    required this.desc,
    required this.location,
    required this.wheelchair,
    required this.isStation,
    required this.parent,
    required this.routes,
  });

  Stop withParent(Stop parent) => Stop(
    feedId: feedId,
    gtfsId: gtfsId,
    code: code,
    name: name,
    desc: desc,
    location: location,
    wheelchair: wheelchair,
    isStation: isStation,
    parent: parent,
    routes: routes,
  );
}
