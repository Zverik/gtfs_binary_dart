import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart' as g;

class Route {
  final int feedId;
  final g.Agency agency;
  final g.RouteType type;
  final String name;
  final String? longName;
  final String? desc;
  final int color;
  final int textColor;
  final List<String> headsigns;

  Route({
    required this.feedId,
    required this.agency,
    required this.type,
    required this.name,
    required this.longName,
    required this.desc,
    required this.color,
    required this.textColor,
    required this.headsigns,
  });

  factory Route.fromProto(int id, g.Route route, g.Agencies agencies) => Route(
    feedId: id,
    agency: agencies.agencies[route.agencyId],
    type: route.type,
    name: route.shortName,
    longName: route.longName.isEmpty ? null : route.longName,
    desc: route.desc.isEmpty ? null : route.desc,
    color: route.color == 0
        ? 0xFFFFFF
        : route.color == 0xFFFFFF
        ? 0
        : route.color,
    textColor: route.textColor,
    headsigns: route.headsigns,
  );
}
