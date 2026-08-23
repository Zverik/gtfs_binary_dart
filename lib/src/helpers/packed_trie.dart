import 'dart:convert' show utf8;
import 'dart:math' show min;

import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';

class PackedTrie {
  final StopLookup trie;
  late final List<int> edgeOffsets;
  late final List<int> stopOffsets;

  PackedTrie(this.trie) {
    edgeOffsets = _accumulate(trie.nodeEdgeOffset);
    stopOffsets = _accumulate(trie.nodeStopOffset);
  }

  List<int> find(String query) {
    query = query.trim();
    if (query.isEmpty) return [];
    final qb = utf8.encode(query);
    int qbIdx = 0;
    int node = 0;
    while (qbIdx < qb.length) {
      bool found = false;
      for (int edgeIdx = 0; edgeIdx < trie.nodeEdgeCount[node]; edgeIdx++) {
        final edge = edgeOffsets[node] + edgeIdx;
        final pStart = trie.edgeLabelOffset[edge];
        final prefix = trie.stringBlob.sublist(pStart, pStart + trie.edgeLabelLength[edge]);
        if (_isEitherPrefix(qb.sublist(qbIdx), prefix)) {
          node = trie.edgeNodeIndex[edge];
          qbIdx += min(prefix.length, qb.length - qbIdx);
          found = true;
        }
      }
      if (!found) return [];
    }

    final firstStop = stopOffsets[node];
    return trie.stopIds.sublist(firstStop, firstStop + trie.nodeStopCount[node]);
  }

  List<int> _accumulate(List<int> source) {
    if (source.length < 2) return source;
    final result = <int>[];
    for (final int element in source) {
      result.add(element + (result.lastOrNull ?? 0));
    }
    return result;
  }

  bool _isEitherPrefix(List<int> a, List<int> b) =>
      a.isNotEmpty && b.isNotEmpty && Iterable.generate(min(a.length, b.length), (i) => a[i] == b[i]).every((el) => el);
}
