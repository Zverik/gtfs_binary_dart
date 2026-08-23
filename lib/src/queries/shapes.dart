import 'package:gtfs_binary_dart/src/helpers/binary_reader.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';
import 'package:latlong2/latlong.dart';

class ShapeQueries {
  final BinaryReader access;
  final ShapeMetadata shapes;
  final int shapesOffset;

  ShapeQueries({required this.access, required this.shapes, required this.shapesOffset});

  List<LatLng> getShapeById(int shapeId) {
    int chunkId = (shapeId / shapes.chunkSize).floor();
    int offset = shapesOffset + shapes.chunkLengths.sublist(0, chunkId).fold(0, (a, b) => a + b);
    final chunk = ShapeChunk.fromBuffer(access.read(offset, shapes.chunkLengths[chunkId]));
    final shape = chunk.shapes[shapeId - chunkId * shapes.chunkSize];
    final path = <LatLng>[];
    int lastLon = 0;
    int lastLat = 0;
    for (int i = 0; i < shape.latitudes.length; i++) {
      lastLat += shape.latitudes[i];
      lastLon += shape.longitudes[i];
      path.add(LatLng(lastLat / 100000.0, lastLon / 100000.0));
    }
    return path;
  }
}