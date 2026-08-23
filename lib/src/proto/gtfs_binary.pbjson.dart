//
//  Generated code. Do not modify.
//  source: gtfs_binary.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use blockDescriptor instead')
const Block$json = {
  '1': 'Block',
  '2': [
    {'1': 'B_UNKNOWN', '2': 0},
    {'1': 'B_STOPS', '2': 1},
    {'1': 'B_CALENDAR', '2': 2},
    {'1': 'B_ROUTES', '2': 3},
    {'1': 'B_SHAPES', '2': 4},
    {'1': 'B_LOOKUP', '2': 5},
    {'1': 'B_AGENCIES', '2': 6},
  ],
};

/// Descriptor for `Block`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List blockDescriptor = $convert.base64Decode(
    'CgVCbG9jaxINCglCX1VOS05PV04QABILCgdCX1NUT1BTEAESDgoKQl9DQUxFTkRBUhACEgwKCE'
    'JfUk9VVEVTEAMSDAoIQl9TSEFQRVMQBBIMCghCX0xPT0tVUBAFEg4KCkJfQUdFTkNJRVMQBg==');

@$core.Deprecated('Use realtimeTypeDescriptor instead')
const RealtimeType$json = {
  '1': 'RealtimeType',
  '2': [
    {'1': 'RT_UNKNOWN', '2': 0},
    {'1': 'RT_GTFS', '2': 1},
  ],
};

/// Descriptor for `RealtimeType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List realtimeTypeDescriptor = $convert.base64Decode(
    'CgxSZWFsdGltZVR5cGUSDgoKUlRfVU5LTk9XThAAEgsKB1JUX0dURlMQAQ==');

@$core.Deprecated('Use accessibilityDescriptor instead')
const Accessibility$json = {
  '1': 'Accessibility',
  '2': [
    {'1': 'A_UNKNOWN', '2': 0},
    {'1': 'A_SOME', '2': 1},
    {'1': 'A_NO', '2': 2},
  ],
};

/// Descriptor for `Accessibility`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List accessibilityDescriptor = $convert.base64Decode(
    'Cg1BY2Nlc3NpYmlsaXR5Eg0KCUFfVU5LTk9XThAAEgoKBkFfU09NRRABEggKBEFfTk8QAg==');

@$core.Deprecated('Use pickupDropoffDescriptor instead')
const PickupDropoff$json = {
  '1': 'PickupDropoff',
  '2': [
    {'1': 'PD_YES', '2': 0},
    {'1': 'PD_NO', '2': 1},
    {'1': 'PD_PHONE_AGENCY', '2': 2},
    {'1': 'PD_TELL_DRIVER', '2': 3},
  ],
};

/// Descriptor for `PickupDropoff`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List pickupDropoffDescriptor = $convert.base64Decode(
    'Cg1QaWNrdXBEcm9wb2ZmEgoKBlBEX1lFUxAAEgkKBVBEX05PEAESEwoPUERfUEhPTkVfQUdFTk'
    'NZEAISEgoOUERfVEVMTF9EUklWRVIQAw==');

@$core.Deprecated('Use routeTypeDescriptor instead')
const RouteType$json = {
  '1': 'RouteType',
  '2': [
    {'1': 'T_BUS', '2': 0},
    {'1': 'T_TRAM', '2': 1},
    {'1': 'T_SUBWAY', '2': 2},
    {'1': 'T_RAIL', '2': 3},
    {'1': 'T_FERRY', '2': 4},
    {'1': 'T_CABLE_TRAM', '2': 5},
    {'1': 'T_AERIAL', '2': 6},
    {'1': 'T_FUNICULAR', '2': 7},
    {'1': 'T_COMMUNAL_TAXI', '2': 9},
    {'1': 'T_COACH', '2': 10},
    {'1': 'T_TROLLEYBUS', '2': 11},
    {'1': 'T_MONORAIL', '2': 12},
    {'1': 'T_URBAN_RAIL', '2': 21},
    {'1': 'T_WATER', '2': 22},
    {'1': 'T_AIR', '2': 23},
    {'1': 'T_TAXI', '2': 24},
    {'1': 'T_MISC', '2': 25},
  ],
};

/// Descriptor for `RouteType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List routeTypeDescriptor = $convert.base64Decode(
    'CglSb3V0ZVR5cGUSCQoFVF9CVVMQABIKCgZUX1RSQU0QARIMCghUX1NVQldBWRACEgoKBlRfUk'
    'FJTBADEgsKB1RfRkVSUlkQBBIQCgxUX0NBQkxFX1RSQU0QBRIMCghUX0FFUklBTBAGEg8KC1Rf'
    'RlVOSUNVTEFSEAcSEwoPVF9DT01NVU5BTF9UQVhJEAkSCwoHVF9DT0FDSBAKEhAKDFRfVFJPTE'
    'xFWUJVUxALEg4KClRfTU9OT1JBSUwQDBIQCgxUX1VSQkFOX1JBSUwQFRILCgdUX1dBVEVSEBYS'
    'CQoFVF9BSVIQFxIKCgZUX1RBWEkQGBIKCgZUX01JU0MQGQ==');

@$core.Deprecated('Use footerDescriptor instead')
const Footer$json = {
  '1': 'Footer',
  '2': [
    {'1': 'version', '3': 1, '4': 1, '5': 13, '10': 'version'},
    {'1': 'date', '3': 2, '4': 1, '5': 13, '10': 'date'},
    {'1': 'original_url', '3': 3, '4': 1, '5': 9, '10': 'originalUrl'},
    {'1': 'compressed', '3': 4, '4': 1, '5': 8, '10': 'compressed'},
    {'1': 'blocks', '3': 6, '4': 3, '5': 11, '6': '.gtfs.BlockMetadata', '10': 'blocks'},
  ],
};

/// Descriptor for `Footer`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List footerDescriptor = $convert.base64Decode(
    'CgZGb290ZXISGAoHdmVyc2lvbhgBIAEoDVIHdmVyc2lvbhISCgRkYXRlGAIgASgNUgRkYXRlEi'
    'EKDG9yaWdpbmFsX3VybBgDIAEoCVILb3JpZ2luYWxVcmwSHgoKY29tcHJlc3NlZBgEIAEoCFIK'
    'Y29tcHJlc3NlZBIrCgZibG9ja3MYBiADKAsyEy5ndGZzLkJsb2NrTWV0YWRhdGFSBmJsb2Nrcw'
    '==');

@$core.Deprecated('Use blockMetadataDescriptor instead')
const BlockMetadata$json = {
  '1': 'BlockMetadata',
  '2': [
    {'1': 'block', '3': 1, '4': 1, '5': 14, '6': '.gtfs.Block', '10': 'block'},
    {'1': 'offset', '3': 2, '4': 1, '5': 4, '10': 'offset'},
    {'1': 'length', '3': 3, '4': 1, '5': 13, '10': 'length'},
    {'1': 'compressed', '3': 4, '4': 1, '5': 8, '10': 'compressed'},
  ],
};

/// Descriptor for `BlockMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List blockMetadataDescriptor = $convert.base64Decode(
    'Cg1CbG9ja01ldGFkYXRhEiEKBWJsb2NrGAEgASgOMgsuZ3Rmcy5CbG9ja1IFYmxvY2sSFgoGb2'
    'Zmc2V0GAIgASgEUgZvZmZzZXQSFgoGbGVuZ3RoGAMgASgNUgZsZW5ndGgSHgoKY29tcHJlc3Nl'
    'ZBgEIAEoCFIKY29tcHJlc3NlZA==');

@$core.Deprecated('Use agenciesDescriptor instead')
const Agencies$json = {
  '1': 'Agencies',
  '2': [
    {'1': 'agencies', '3': 1, '4': 3, '5': 11, '6': '.gtfs.Agency', '10': 'agencies'},
    {'1': 'ticket_info', '3': 2, '4': 3, '5': 9, '10': 'ticketInfo'},
    {'1': 'realtime', '3': 3, '4': 3, '5': 11, '6': '.gtfs.Realtime', '10': 'realtime'},
  ],
};

/// Descriptor for `Agencies`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agenciesDescriptor = $convert.base64Decode(
    'CghBZ2VuY2llcxIoCghhZ2VuY2llcxgBIAMoCzIMLmd0ZnMuQWdlbmN5UghhZ2VuY2llcxIfCg'
    't0aWNrZXRfaW5mbxgCIAMoCVIKdGlja2V0SW5mbxIqCghyZWFsdGltZRgDIAMoCzIOLmd0ZnMu'
    'UmVhbHRpbWVSCHJlYWx0aW1l');

@$core.Deprecated('Use agencyDescriptor instead')
const Agency$json = {
  '1': 'Agency',
  '2': [
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
    {'1': 'timezone', '3': 3, '4': 1, '5': 9, '10': 'timezone'},
    {'1': 'lang', '3': 4, '4': 1, '5': 9, '10': 'lang'},
    {'1': 'phone', '3': 5, '4': 1, '5': 9, '10': 'phone'},
    {'1': 'fare_url', '3': 6, '4': 1, '5': 9, '10': 'fareUrl'},
    {'1': 'email', '3': 7, '4': 1, '5': 9, '10': 'email'},
    {'1': 'ticket_info', '3': 8, '4': 1, '5': 13, '10': 'ticketInfo'},
    {'1': 'realtime', '3': 9, '4': 1, '5': 13, '10': 'realtime'},
  ],
};

/// Descriptor for `Agency`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List agencyDescriptor = $convert.base64Decode(
    'CgZBZ2VuY3kSEgoEbmFtZRgBIAEoCVIEbmFtZRIQCgN1cmwYAiABKAlSA3VybBIaCgh0aW1lem'
    '9uZRgDIAEoCVIIdGltZXpvbmUSEgoEbGFuZxgEIAEoCVIEbGFuZxIUCgVwaG9uZRgFIAEoCVIF'
    'cGhvbmUSGQoIZmFyZV91cmwYBiABKAlSB2ZhcmVVcmwSFAoFZW1haWwYByABKAlSBWVtYWlsEh'
    '8KC3RpY2tldF9pbmZvGAggASgNUgp0aWNrZXRJbmZvEhoKCHJlYWx0aW1lGAkgASgNUghyZWFs'
    'dGltZQ==');

@$core.Deprecated('Use realtimeDescriptor instead')
const Realtime$json = {
  '1': 'Realtime',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.gtfs.RealtimeType', '10': 'type'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Realtime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List realtimeDescriptor = $convert.base64Decode(
    'CghSZWFsdGltZRImCgR0eXBlGAEgASgOMhIuZ3Rmcy5SZWFsdGltZVR5cGVSBHR5cGUSEAoDdX'
    'JsGAIgASgJUgN1cmw=');

@$core.Deprecated('Use shapeMetadataDescriptor instead')
const ShapeMetadata$json = {
  '1': 'ShapeMetadata',
  '2': [
    {'1': 'chunk_size', '3': 1, '4': 1, '5': 13, '10': 'chunkSize'},
    {'1': 'chunk_lengths', '3': 2, '4': 3, '5': 13, '10': 'chunkLengths'},
  ],
};

/// Descriptor for `ShapeMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shapeMetadataDescriptor = $convert.base64Decode(
    'Cg1TaGFwZU1ldGFkYXRhEh0KCmNodW5rX3NpemUYASABKA1SCWNodW5rU2l6ZRIjCg1jaHVua1'
    '9sZW5ndGhzGAIgAygNUgxjaHVua0xlbmd0aHM=');

@$core.Deprecated('Use shapeChunkDescriptor instead')
const ShapeChunk$json = {
  '1': 'ShapeChunk',
  '2': [
    {'1': 'shapes', '3': 1, '4': 3, '5': 11, '6': '.gtfs.Shape', '10': 'shapes'},
  ],
};

/// Descriptor for `ShapeChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shapeChunkDescriptor = $convert.base64Decode(
    'CgpTaGFwZUNodW5rEiMKBnNoYXBlcxgBIAMoCzILLmd0ZnMuU2hhcGVSBnNoYXBlcw==');

@$core.Deprecated('Use shapeDescriptor instead')
const Shape$json = {
  '1': 'Shape',
  '2': [
    {'1': 'longitudes', '3': 1, '4': 3, '5': 17, '10': 'longitudes'},
    {'1': 'latitudes', '3': 2, '4': 3, '5': 17, '10': 'latitudes'},
  ],
};

/// Descriptor for `Shape`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List shapeDescriptor = $convert.base64Decode(
    'CgVTaGFwZRIeCgpsb25naXR1ZGVzGAEgAygRUgpsb25naXR1ZGVzEhwKCWxhdGl0dWRlcxgCIA'
    'MoEVIJbGF0aXR1ZGVz');

@$core.Deprecated('Use stopMetadataDescriptor instead')
const StopMetadata$json = {
  '1': 'StopMetadata',
  '2': [
    {'1': 'geohash_xor', '3': 1, '4': 1, '5': 13, '10': 'geohashXor'},
    {'1': 'geohashes', '3': 2, '4': 3, '5': 13, '10': 'geohashes'},
    {'1': 'chunk_lengths', '3': 3, '4': 3, '5': 17, '10': 'chunkLengths'},
    {'1': 'chunk_stop_counts', '3': 4, '4': 3, '5': 13, '10': 'chunkStopCounts'},
    {'1': 'has_stations', '3': 5, '4': 1, '5': 8, '10': 'hasStations'},
  ],
};

/// Descriptor for `StopMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopMetadataDescriptor = $convert.base64Decode(
    'CgxTdG9wTWV0YWRhdGESHwoLZ2VvaGFzaF94b3IYASABKA1SCmdlb2hhc2hYb3ISHAoJZ2VvaG'
    'FzaGVzGAIgAygNUglnZW9oYXNoZXMSIwoNY2h1bmtfbGVuZ3RocxgDIAMoEVIMY2h1bmtMZW5n'
    'dGhzEioKEWNodW5rX3N0b3BfY291bnRzGAQgAygNUg9jaHVua1N0b3BDb3VudHMSIQoMaGFzX3'
    'N0YXRpb25zGAUgASgIUgtoYXNTdGF0aW9ucw==');

@$core.Deprecated('Use stopsChunkDescriptor instead')
const StopsChunk$json = {
  '1': 'StopsChunk',
  '2': [
    {'1': 'gtfs_id', '3': 1, '4': 1, '5': 9, '10': 'gtfsId'},
    {'1': 'code', '3': 2, '4': 1, '5': 9, '10': 'code'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'desc', '3': 4, '4': 1, '5': 9, '10': 'desc'},
    {'1': 'lat', '3': 5, '4': 1, '5': 17, '10': 'lat'},
    {'1': 'lon', '3': 6, '4': 1, '5': 17, '10': 'lon'},
    {'1': 'wheelchair', '3': 7, '4': 1, '5': 14, '6': '.gtfs.Accessibility', '10': 'wheelchair'},
    {'1': 'route_ids', '3': 8, '4': 3, '5': 13, '10': 'routeIds'},
    {'1': 'is_station', '3': 9, '4': 1, '5': 8, '10': 'isStation'},
    {'1': 'parent_id', '3': 10, '4': 1, '5': 13, '10': 'parentId'},
    {'1': 'geohash', '3': 30, '4': 1, '5': 13, '10': 'geohash'},
  ],
};

/// Descriptor for `StopsChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopsChunkDescriptor = $convert.base64Decode(
    'CgpTdG9wc0NodW5rEhcKB2d0ZnNfaWQYASABKAlSBmd0ZnNJZBISCgRjb2RlGAIgASgJUgRjb2'
    'RlEhIKBG5hbWUYAyABKAlSBG5hbWUSEgoEZGVzYxgEIAEoCVIEZGVzYxIQCgNsYXQYBSABKBFS'
    'A2xhdBIQCgNsb24YBiABKBFSA2xvbhIzCgp3aGVlbGNoYWlyGAcgASgOMhMuZ3Rmcy5BY2Nlc3'
    'NpYmlsaXR5Ugp3aGVlbGNoYWlyEhsKCXJvdXRlX2lkcxgIIAMoDVIIcm91dGVJZHMSHQoKaXNf'
    'c3RhdGlvbhgJIAEoCFIJaXNTdGF0aW9uEhsKCXBhcmVudF9pZBgKIAEoDVIIcGFyZW50SWQSGA'
    'oHZ2VvaGFzaBgeIAEoDVIHZ2VvaGFzaA==');

@$core.Deprecated('Use lookupMetadataDescriptor instead')
const LookupMetadata$json = {
  '1': 'LookupMetadata',
  '2': [
    {'1': 'stop_by_name', '3': 1, '4': 1, '5': 11, '6': '.gtfs.StopLookup', '10': 'stopByName'},
    {'1': 'stop_by_gtfs_id', '3': 2, '4': 1, '5': 11, '6': '.gtfs.StopLookup', '10': 'stopByGtfsId'},
    {'1': 'route_by_gtfs_id', '3': 3, '4': 1, '5': 11, '6': '.gtfs.StopLookup', '10': 'routeByGtfsId'},
  ],
};

/// Descriptor for `LookupMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List lookupMetadataDescriptor = $convert.base64Decode(
    'Cg5Mb29rdXBNZXRhZGF0YRIyCgxzdG9wX2J5X25hbWUYASABKAsyEC5ndGZzLlN0b3BMb29rdX'
    'BSCnN0b3BCeU5hbWUSNwoPc3RvcF9ieV9ndGZzX2lkGAIgASgLMhAuZ3Rmcy5TdG9wTG9va3Vw'
    'UgxzdG9wQnlHdGZzSWQSOQoQcm91dGVfYnlfZ3Rmc19pZBgDIAEoCzIQLmd0ZnMuU3RvcExvb2'
    't1cFINcm91dGVCeUd0ZnNJZA==');

@$core.Deprecated('Use stopLookupDescriptor instead')
const StopLookup$json = {
  '1': 'StopLookup',
  '2': [
    {'1': 'string_blob', '3': 1, '4': 1, '5': 12, '10': 'stringBlob'},
    {'1': 'stop_ids', '3': 2, '4': 3, '5': 13, '10': 'stopIds'},
    {'1': 'node_edge_offset', '3': 3, '4': 3, '5': 13, '10': 'nodeEdgeOffset'},
    {'1': 'node_edge_count', '3': 4, '4': 3, '5': 13, '10': 'nodeEdgeCount'},
    {'1': 'node_stop_offset', '3': 5, '4': 3, '5': 13, '10': 'nodeStopOffset'},
    {'1': 'node_stop_count', '3': 6, '4': 3, '5': 13, '10': 'nodeStopCount'},
    {'1': 'edge_label_offset', '3': 7, '4': 3, '5': 13, '10': 'edgeLabelOffset'},
    {'1': 'edge_label_length', '3': 8, '4': 3, '5': 13, '10': 'edgeLabelLength'},
    {'1': 'edge_node_index', '3': 9, '4': 3, '5': 13, '10': 'edgeNodeIndex'},
  ],
};

/// Descriptor for `StopLookup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stopLookupDescriptor = $convert.base64Decode(
    'CgpTdG9wTG9va3VwEh8KC3N0cmluZ19ibG9iGAEgASgMUgpzdHJpbmdCbG9iEhkKCHN0b3BfaW'
    'RzGAIgAygNUgdzdG9wSWRzEigKEG5vZGVfZWRnZV9vZmZzZXQYAyADKA1SDm5vZGVFZGdlT2Zm'
    'c2V0EiYKD25vZGVfZWRnZV9jb3VudBgEIAMoDVINbm9kZUVkZ2VDb3VudBIoChBub2RlX3N0b3'
    'Bfb2Zmc2V0GAUgAygNUg5ub2RlU3RvcE9mZnNldBImCg9ub2RlX3N0b3BfY291bnQYBiADKA1S'
    'DW5vZGVTdG9wQ291bnQSKgoRZWRnZV9sYWJlbF9vZmZzZXQYByADKA1SD2VkZ2VMYWJlbE9mZn'
    'NldBIqChFlZGdlX2xhYmVsX2xlbmd0aBgIIAMoDVIPZWRnZUxhYmVsTGVuZ3RoEiYKD2VkZ2Vf'
    'bm9kZV9pbmRleBgJIAMoDVINZWRnZU5vZGVJbmRleA==');

@$core.Deprecated('Use calendarMetadataDescriptor instead')
const CalendarMetadata$json = {
  '1': 'CalendarMetadata',
  '2': [
    {'1': 'base_date', '3': 1, '4': 1, '5': 13, '10': 'baseDate'},
    {'1': 'start_dates', '3': 2, '4': 3, '5': 13, '10': 'startDates'},
    {'1': 'end_dates', '3': 3, '4': 3, '5': 13, '10': 'endDates'},
    {'1': 'weekdays', '3': 4, '4': 3, '5': 13, '10': 'weekdays'},
    {'1': 'days_in_month', '3': 5, '4': 1, '5': 13, '10': 'daysInMonth'},
    {'1': 'month_lengths', '3': 6, '4': 3, '5': 17, '10': 'monthLengths'},
  ],
};

/// Descriptor for `CalendarMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calendarMetadataDescriptor = $convert.base64Decode(
    'ChBDYWxlbmRhck1ldGFkYXRhEhsKCWJhc2VfZGF0ZRgBIAEoDVIIYmFzZURhdGUSHwoLc3Rhcn'
    'RfZGF0ZXMYAiADKA1SCnN0YXJ0RGF0ZXMSGwoJZW5kX2RhdGVzGAMgAygNUghlbmREYXRlcxIa'
    'Cgh3ZWVrZGF5cxgEIAMoDVIId2Vla2RheXMSIgoNZGF5c19pbl9tb250aBgFIAEoDVILZGF5c0'
    'luTW9udGgSIwoNbW9udGhfbGVuZ3RocxgGIAMoEVIMbW9udGhMZW5ndGhz');

@$core.Deprecated('Use calendarMonthDescriptor instead')
const CalendarMonth$json = {
  '1': 'CalendarMonth',
  '2': [
    {'1': 'date_offsets', '3': 1, '4': 3, '5': 13, '10': 'dateOffsets'},
    {'1': 'dates', '3': 2, '4': 3, '5': 11, '6': '.gtfs.CalendarDate', '10': 'dates'},
  ],
};

/// Descriptor for `CalendarMonth`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calendarMonthDescriptor = $convert.base64Decode(
    'Cg1DYWxlbmRhck1vbnRoEiEKDGRhdGVfb2Zmc2V0cxgBIAMoDVILZGF0ZU9mZnNldHMSKAoFZG'
    'F0ZXMYAiADKAsyEi5ndGZzLkNhbGVuZGFyRGF0ZVIFZGF0ZXM=');

@$core.Deprecated('Use calendarDateDescriptor instead')
const CalendarDate$json = {
  '1': 'CalendarDate',
  '2': [
    {'1': 'included_in', '3': 1, '4': 3, '5': 13, '10': 'includedIn'},
    {'1': 'exception_in', '3': 2, '4': 3, '5': 13, '10': 'exceptionIn'},
  ],
};

/// Descriptor for `CalendarDate`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List calendarDateDescriptor = $convert.base64Decode(
    'CgxDYWxlbmRhckRhdGUSHwoLaW5jbHVkZWRfaW4YASADKA1SCmluY2x1ZGVkSW4SIQoMZXhjZX'
    'B0aW9uX2luGAIgAygNUgtleGNlcHRpb25Jbg==');

@$core.Deprecated('Use routeMetadataDescriptor instead')
const RouteMetadata$json = {
  '1': 'RouteMetadata',
  '2': [
    {'1': 'route_lengths', '3': 1, '4': 3, '5': 13, '10': 'routeLengths'},
    {'1': 'has_wheelchair_info', '3': 2, '4': 1, '5': 8, '10': 'hasWheelchairInfo'},
    {'1': 'has_bike_info', '3': 3, '4': 1, '5': 8, '10': 'hasBikeInfo'},
  ],
};

/// Descriptor for `RouteMetadata`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeMetadataDescriptor = $convert.base64Decode(
    'Cg1Sb3V0ZU1ldGFkYXRhEiMKDXJvdXRlX2xlbmd0aHMYASADKA1SDHJvdXRlTGVuZ3RocxIuCh'
    'NoYXNfd2hlZWxjaGFpcl9pbmZvGAIgASgIUhFoYXNXaGVlbGNoYWlySW5mbxIiCg1oYXNfYmlr'
    'ZV9pbmZvGAMgASgIUgtoYXNCaWtlSW5mbw==');

@$core.Deprecated('Use routeDescriptor instead')
const Route$json = {
  '1': 'Route',
  '2': [
    {'1': 'agency_id', '3': 1, '4': 1, '5': 13, '10': 'agencyId'},
    {'1': 'gtfs_id', '3': 2, '4': 1, '5': 9, '10': 'gtfsId'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.gtfs.RouteType', '10': 'type'},
    {'1': 'short_name', '3': 4, '4': 1, '5': 9, '10': 'shortName'},
    {'1': 'long_name', '3': 5, '4': 1, '5': 9, '10': 'longName'},
    {'1': 'desc', '3': 6, '4': 1, '5': 9, '10': 'desc'},
    {'1': 'color', '3': 7, '4': 1, '5': 13, '10': 'color'},
    {'1': 'text_color', '3': 8, '4': 1, '5': 13, '10': 'textColor'},
    {'1': 'has_frequencies', '3': 9, '4': 1, '5': 8, '10': 'hasFrequencies'},
    {'1': 'itineraries', '3': 10, '4': 3, '5': 11, '6': '.gtfs.Itinerary', '10': 'itineraries'},
    {'1': 'headsigns', '3': 11, '4': 3, '5': 9, '10': 'headsigns'},
  ],
};

/// Descriptor for `Route`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List routeDescriptor = $convert.base64Decode(
    'CgVSb3V0ZRIbCglhZ2VuY3lfaWQYASABKA1SCGFnZW5jeUlkEhcKB2d0ZnNfaWQYAiABKAlSBm'
    'd0ZnNJZBIjCgR0eXBlGAMgASgOMg8uZ3Rmcy5Sb3V0ZVR5cGVSBHR5cGUSHQoKc2hvcnRfbmFt'
    'ZRgEIAEoCVIJc2hvcnROYW1lEhsKCWxvbmdfbmFtZRgFIAEoCVIIbG9uZ05hbWUSEgoEZGVzYx'
    'gGIAEoCVIEZGVzYxIUCgVjb2xvchgHIAEoDVIFY29sb3ISHQoKdGV4dF9jb2xvchgIIAEoDVIJ'
    'dGV4dENvbG9yEicKD2hhc19mcmVxdWVuY2llcxgJIAEoCFIOaGFzRnJlcXVlbmNpZXMSMQoLaX'
    'RpbmVyYXJpZXMYCiADKAsyDy5ndGZzLkl0aW5lcmFyeVILaXRpbmVyYXJpZXMSHAoJaGVhZHNp'
    'Z25zGAsgAygJUgloZWFkc2lnbnM=');

@$core.Deprecated('Use itineraryDescriptor instead')
const Itinerary$json = {
  '1': 'Itinerary',
  '2': [
    {'1': 'shape_id', '3': 1, '4': 1, '5': 13, '10': 'shapeId'},
    {'1': 'stop_ids', '3': 2, '4': 3, '5': 13, '10': 'stopIds'},
    {'1': 'headsigns', '3': 3, '4': 1, '5': 12, '10': 'headsigns'},
    {'1': 'pickup_types', '3': 4, '4': 1, '5': 12, '10': 'pickupTypes'},
    {'1': 'dropoff_types', '3': 5, '4': 1, '5': 12, '10': 'dropoffTypes'},
    {'1': 'opposite_direction', '3': 6, '4': 1, '5': 8, '10': 'oppositeDirection'},
    {'1': 'departure_deltas', '3': 7, '4': 3, '5': 13, '10': 'departureDeltas'},
    {'1': 'service_ids', '3': 8, '4': 3, '5': 13, '10': 'serviceIds'},
    {'1': 'trips', '3': 9, '4': 1, '5': 12, '10': 'trips'},
  ],
};

/// Descriptor for `Itinerary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List itineraryDescriptor = $convert.base64Decode(
    'CglJdGluZXJhcnkSGQoIc2hhcGVfaWQYASABKA1SB3NoYXBlSWQSGQoIc3RvcF9pZHMYAiADKA'
    '1SB3N0b3BJZHMSHAoJaGVhZHNpZ25zGAMgASgMUgloZWFkc2lnbnMSIQoMcGlja3VwX3R5cGVz'
    'GAQgASgMUgtwaWNrdXBUeXBlcxIjCg1kcm9wb2ZmX3R5cGVzGAUgASgMUgxkcm9wb2ZmVHlwZX'
    'MSLQoSb3Bwb3NpdGVfZGlyZWN0aW9uGAYgASgIUhFvcHBvc2l0ZURpcmVjdGlvbhIpChBkZXBh'
    'cnR1cmVfZGVsdGFzGAcgAygNUg9kZXBhcnR1cmVEZWx0YXMSHwoLc2VydmljZV9pZHMYCCADKA'
    '1SCnNlcnZpY2VJZHMSFAoFdHJpcHMYCSABKAxSBXRyaXBz');

@$core.Deprecated('Use tripsChunkDescriptor instead')
const TripsChunk$json = {
  '1': 'TripsChunk',
  '2': [
    {'1': 'first_stop_departure', '3': 1, '4': 1, '5': 13, '10': 'firstStopDeparture'},
    {'1': 'departure_deltas', '3': 2, '4': 3, '5': 17, '10': 'departureDeltas'},
    {'1': 'gtfs_id', '3': 3, '4': 1, '5': 9, '10': 'gtfsId'},
    {'1': 'approximate', '3': 4, '4': 1, '5': 8, '10': 'approximate'},
    {'1': 'end_time', '3': 5, '4': 1, '5': 13, '10': 'endTime'},
    {'1': 'interval', '3': 6, '4': 1, '5': 13, '10': 'interval'},
    {'1': 'wheelchair', '3': 7, '4': 1, '5': 14, '6': '.gtfs.Accessibility', '10': 'wheelchair'},
    {'1': 'bikes', '3': 8, '4': 1, '5': 14, '6': '.gtfs.Accessibility', '10': 'bikes'},
  ],
};

/// Descriptor for `TripsChunk`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List tripsChunkDescriptor = $convert.base64Decode(
    'CgpUcmlwc0NodW5rEjAKFGZpcnN0X3N0b3BfZGVwYXJ0dXJlGAEgASgNUhJmaXJzdFN0b3BEZX'
    'BhcnR1cmUSKQoQZGVwYXJ0dXJlX2RlbHRhcxgCIAMoEVIPZGVwYXJ0dXJlRGVsdGFzEhcKB2d0'
    'ZnNfaWQYAyABKAlSBmd0ZnNJZBIgCgthcHByb3hpbWF0ZRgEIAEoCFILYXBwcm94aW1hdGUSGQ'
    'oIZW5kX3RpbWUYBSABKA1SB2VuZFRpbWUSGgoIaW50ZXJ2YWwYBiABKA1SCGludGVydmFsEjMK'
    'CndoZWVsY2hhaXIYByABKA4yEy5ndGZzLkFjY2Vzc2liaWxpdHlSCndoZWVsY2hhaXISKQoFYm'
    'lrZXMYCCABKA4yEy5ndGZzLkFjY2Vzc2liaWxpdHlSBWJpa2Vz');

