import 'dart:typed_data';

import 'package:gtfs_binary_dart/src/helpers/decoder.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';

class UnpackedItinerary {
  final int? shapeId;
  final List<int> stopIds;
  final List<int> headsigns;
  final List<PickupDropoff> pickupTypes;
  final List<PickupDropoff> dropoffTypes;
  final bool oppositeDirection;
  final List<int> departureDeltas;
  final List<int> serviceIds;
  final Uint8List trips;

  UnpackedItinerary(Itinerary itin)
    : shapeId = itin.shapeId == 0 ? null : itin.shapeId - 1,
      stopIds = itin.stopIds,
      headsigns = BinaryDecoder(Uint8List.fromList(itin.headsigns)).readUintsRle(itin.stopIds.length),
      pickupTypes = itin.pickupTypes.isEmpty
          ? []
          : BinaryDecoder(
              Uint8List.fromList(itin.pickupTypes),
            ).read2Bit(itin.stopIds.length).map((pd) => PickupDropoff.valueOf(pd)!).toList(),
      dropoffTypes = itin.dropoffTypes.isEmpty
          ? []
          : BinaryDecoder(
              Uint8List.fromList(itin.dropoffTypes),
            ).read2Bit(itin.stopIds.length).map((pd) => PickupDropoff.valueOf(pd)!).toList(),
      oppositeDirection = itin.oppositeDirection,
      departureDeltas = itin.departureDeltas,
      serviceIds = itin.serviceIds,
      trips = Uint8List.fromList(itin.trips);
}
