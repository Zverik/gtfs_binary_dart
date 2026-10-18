//
//  Generated code. Do not modify.
//  source: gtfs_binary.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Block extends $pb.ProtobufEnum {
  static const Block B_UNKNOWN = Block._(0, _omitEnumNames ? '' : 'B_UNKNOWN');
  static const Block B_STOPS = Block._(1, _omitEnumNames ? '' : 'B_STOPS');
  static const Block B_CALENDAR = Block._(2, _omitEnumNames ? '' : 'B_CALENDAR');
  static const Block B_ROUTES = Block._(3, _omitEnumNames ? '' : 'B_ROUTES');
  static const Block B_SHAPES = Block._(4, _omitEnumNames ? '' : 'B_SHAPES');
  static const Block B_LOOKUP = Block._(5, _omitEnumNames ? '' : 'B_LOOKUP');
  static const Block B_AGENCIES = Block._(6, _omitEnumNames ? '' : 'B_AGENCIES');

  static const $core.List<Block> values = <Block> [
    B_UNKNOWN,
    B_STOPS,
    B_CALENDAR,
    B_ROUTES,
    B_SHAPES,
    B_LOOKUP,
    B_AGENCIES,
  ];

  static final $core.Map<$core.int, Block> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Block? valueOf($core.int value) => _byValue[value];

  const Block._($core.int v, $core.String n) : super(v, n);
}

class RealtimeType extends $pb.ProtobufEnum {
  static const RealtimeType RT_UNKNOWN = RealtimeType._(0, _omitEnumNames ? '' : 'RT_UNKNOWN');
  static const RealtimeType RT_GTFS = RealtimeType._(1, _omitEnumNames ? '' : 'RT_GTFS');
  static const RealtimeType RT_SIRI = RealtimeType._(2, _omitEnumNames ? '' : 'RT_SIRI');
  static const RealtimeType RT_SIRI_JSON = RealtimeType._(3, _omitEnumNames ? '' : 'RT_SIRI_JSON');

  static const $core.List<RealtimeType> values = <RealtimeType> [
    RT_UNKNOWN,
    RT_GTFS,
    RT_SIRI,
    RT_SIRI_JSON,
  ];

  static final $core.Map<$core.int, RealtimeType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RealtimeType? valueOf($core.int value) => _byValue[value];

  const RealtimeType._($core.int v, $core.String n) : super(v, n);
}

class Accessibility extends $pb.ProtobufEnum {
  static const Accessibility A_UNKNOWN = Accessibility._(0, _omitEnumNames ? '' : 'A_UNKNOWN');
  static const Accessibility A_SOME = Accessibility._(1, _omitEnumNames ? '' : 'A_SOME');
  static const Accessibility A_NO = Accessibility._(2, _omitEnumNames ? '' : 'A_NO');

  static const $core.List<Accessibility> values = <Accessibility> [
    A_UNKNOWN,
    A_SOME,
    A_NO,
  ];

  static final $core.Map<$core.int, Accessibility> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Accessibility? valueOf($core.int value) => _byValue[value];

  const Accessibility._($core.int v, $core.String n) : super(v, n);
}

class Direction extends $pb.ProtobufEnum {
  static const Direction D_UNKNOWN = Direction._(0, _omitEnumNames ? '' : 'D_UNKNOWN');
  static const Direction D_NORTH = Direction._(1, _omitEnumNames ? '' : 'D_NORTH');
  static const Direction D_EAST = Direction._(2, _omitEnumNames ? '' : 'D_EAST');
  static const Direction D_SOUTH = Direction._(3, _omitEnumNames ? '' : 'D_SOUTH');
  static const Direction D_WEST = Direction._(4, _omitEnumNames ? '' : 'D_WEST');

  static const $core.List<Direction> values = <Direction> [
    D_UNKNOWN,
    D_NORTH,
    D_EAST,
    D_SOUTH,
    D_WEST,
  ];

  static final $core.Map<$core.int, Direction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Direction? valueOf($core.int value) => _byValue[value];

  const Direction._($core.int v, $core.String n) : super(v, n);
}

class PickupDropoff extends $pb.ProtobufEnum {
  static const PickupDropoff PD_YES = PickupDropoff._(0, _omitEnumNames ? '' : 'PD_YES');
  static const PickupDropoff PD_NO = PickupDropoff._(1, _omitEnumNames ? '' : 'PD_NO');
  static const PickupDropoff PD_PHONE_AGENCY = PickupDropoff._(2, _omitEnumNames ? '' : 'PD_PHONE_AGENCY');
  static const PickupDropoff PD_TELL_DRIVER = PickupDropoff._(3, _omitEnumNames ? '' : 'PD_TELL_DRIVER');

  static const $core.List<PickupDropoff> values = <PickupDropoff> [
    PD_YES,
    PD_NO,
    PD_PHONE_AGENCY,
    PD_TELL_DRIVER,
  ];

  static final $core.Map<$core.int, PickupDropoff> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PickupDropoff? valueOf($core.int value) => _byValue[value];

  const PickupDropoff._($core.int v, $core.String n) : super(v, n);
}

/// See also https://developers.google.com/transit/gtfs/reference/extended-route-types
class RouteType extends $pb.ProtobufEnum {
  static const RouteType T_BUS = RouteType._(0, _omitEnumNames ? '' : 'T_BUS');
  static const RouteType T_TRAM = RouteType._(1, _omitEnumNames ? '' : 'T_TRAM');
  static const RouteType T_SUBWAY = RouteType._(2, _omitEnumNames ? '' : 'T_SUBWAY');
  static const RouteType T_RAIL = RouteType._(3, _omitEnumNames ? '' : 'T_RAIL');
  static const RouteType T_FERRY = RouteType._(4, _omitEnumNames ? '' : 'T_FERRY');
  static const RouteType T_CABLE_TRAM = RouteType._(5, _omitEnumNames ? '' : 'T_CABLE_TRAM');
  static const RouteType T_AERIAL = RouteType._(6, _omitEnumNames ? '' : 'T_AERIAL');
  static const RouteType T_FUNICULAR = RouteType._(7, _omitEnumNames ? '' : 'T_FUNICULAR');
  static const RouteType T_COMMUNAL_TAXI = RouteType._(9, _omitEnumNames ? '' : 'T_COMMUNAL_TAXI');
  static const RouteType T_COACH = RouteType._(10, _omitEnumNames ? '' : 'T_COACH');
  static const RouteType T_TROLLEYBUS = RouteType._(11, _omitEnumNames ? '' : 'T_TROLLEYBUS');
  static const RouteType T_MONORAIL = RouteType._(12, _omitEnumNames ? '' : 'T_MONORAIL');
  static const RouteType T_URBAN_RAIL = RouteType._(21, _omitEnumNames ? '' : 'T_URBAN_RAIL');
  static const RouteType T_WATER = RouteType._(22, _omitEnumNames ? '' : 'T_WATER');
  static const RouteType T_AIR = RouteType._(23, _omitEnumNames ? '' : 'T_AIR');
  static const RouteType T_TAXI = RouteType._(24, _omitEnumNames ? '' : 'T_TAXI');
  static const RouteType T_MISC = RouteType._(25, _omitEnumNames ? '' : 'T_MISC');

  static const $core.List<RouteType> values = <RouteType> [
    T_BUS,
    T_TRAM,
    T_SUBWAY,
    T_RAIL,
    T_FERRY,
    T_CABLE_TRAM,
    T_AERIAL,
    T_FUNICULAR,
    T_COMMUNAL_TAXI,
    T_COACH,
    T_TROLLEYBUS,
    T_MONORAIL,
    T_URBAN_RAIL,
    T_WATER,
    T_AIR,
    T_TAXI,
    T_MISC,
  ];

  static final $core.Map<$core.int, RouteType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static RouteType? valueOf($core.int value) => _byValue[value];

  const RouteType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
