import 'package:gtfs_binary_dart/src/helpers/binary_reader.dart';
import 'package:gtfs_binary_dart/src/helpers/decoder.dart';
import 'package:gtfs_binary_dart/src/helpers/packed_trie.dart';
import 'package:gtfs_binary_dart/src/models/stop.dart';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';
import 'package:latlong2/latlong.dart';

class StopQueries {
  static final int kGeohashPrecision = 24;

  final BinaryReader access;
  final StopMetadata stops;
  final int stopsOffset;
  final PackedTrie? stopByName;
  final PackedTrie? stopByGtfsId;

  const StopQueries({
    required this.access,
    required this.stops,
    required this.stopsOffset,
    this.stopByName,
    this.stopByGtfsId,
  });

  List<Stop> _decodeStopsChunk(int offset, int length, int firstId, int count) {
    final hasStations = this.stops.hasStations;
    final data = BinaryDecoder(access.read(offset, length));
    final gtfsIds = data.readStrings(count);
    final codes = data.readStrings(count);
    final names = data.readStrings(count);
    final descs = data.readStrings(count);
    final latitudes = data.readSintsDelta(count);
    final longitudes = data.readSintsDelta(count);
    final wheelchair = data.read2Bit(count);
    final routeIds = List.generate(count, (_) => data.readUintsDelta());
    final isStation = !hasStations ? <bool>[] : data.read1Bit(count);
    final parents = !hasStations ? <int>[] : data.readUintsRle(count);
    final stops = [
      for (int i = 0; i < count; i++)
        Stop(
          feedId: firstId + i,
          gtfsId: gtfsIds[i],
          code: codes[i],
          name: names[i],
          desc: descs[i],
          location: LatLng(latitudes[i] / 100000.0, longitudes[i] / 100000.0),
          wheelchair: Accessibility.valueOf(wheelchair[i])!,
          routes: routeIds[i],
          isStation: hasStations ? isStation[i] : false,
          parent: null,
        ),
    ];
    if (hasStations) {
      for (int i = 0; i < count; i++) {
        if (parents[i] > 0) {
          stops[i] = stops[i].withParent(stops[parents[i] - 1]);
        }
      }
    }
    return stops;
  }

  List<Stop> getStopsById(Iterable<int> stopIdSrc) {
    if (stopIdSrc.isEmpty) return const [];
    final stopIds = List.of(stopIdSrc);
    stopIds.sort();
    final result = <Stop>[];
    int offset = stopsOffset;
    int firstStopId = 0;
    int nextStopId = 0;
    for (final stopChunk in stops.chunkLengths.indexed) {
      final stopCount = stops.chunkStopCounts[stopChunk.$1];
      if (stopIds[nextStopId] < firstStopId + stopCount) {
        final readStops = _decodeStopsChunk(offset, stopChunk.$2, firstStopId, stopCount);
        while (nextStopId < stopIds.length && stopIds[nextStopId] < firstStopId + stopCount) {
          result.add(readStops[stopIds[nextStopId] - firstStopId]);
          nextStopId += 1;
        }
      }
      if (nextStopId >= stopIds.length) break;
      offset += stopChunk.$2.abs();
      firstStopId += stopCount;
    }
    return result;
  }

  List<Stop> autocompleteStops(String query) {
    if (stopByName == null) return [];
    final normQuery = query.toLowerCase(); // TODO: better normalization
    final ids = stopByName!.find(normQuery);
    return getStopsById(ids);
  }

  Stop? findByGtfsId(String gtfsId) {
    if (stopByGtfsId == null) return null;
    final ids = stopByGtfsId!.find(gtfsId);
    return ids.isEmpty ? null : getStopsById([ids.first]).first;
  }

  List<Stop> findStopsForGeohashes(List<int> hashes) {
    final hashSet = Set.of(hashes.map((hash) => hash ^ (1 << kGeohashPrecision)));
    final result = <Stop>[];
    int offset = stopsOffset;
    int currentGeohash = 0;
    int firstStopId = 0;
    for (final geohash in stops.geohashes.indexed) {
      currentGeohash += geohash.$2;
      final stopCount = stops.chunkStopCounts[geohash.$1];
      final length = stops.chunkLengths[geohash.$1];
      if (hashSet.contains(currentGeohash ^ stops.geohashXor)) {
        result.addAll(_decodeStopsChunk(offset, length, firstStopId, stopCount));
      }
      offset += length.abs();
      firstStopId += stopCount;
    }
    return result;
  }
}
