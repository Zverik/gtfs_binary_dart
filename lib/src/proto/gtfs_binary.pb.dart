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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'gtfs_binary.pbenum.dart';

export 'gtfs_binary.pbenum.dart';

/// File structure: magic bytes 'GTB\n', blocks, Footer message,
/// 2-byte big-endian length of the footer (a hint taken from ORC format).
class Footer extends $pb.GeneratedMessage {
  factory Footer({
    $core.int? version,
    $core.int? build,
    $core.String? originalUrl,
    $core.bool? compressed,
    $core.Iterable<$core.int>? bboxLatLon,
    $core.Iterable<BlockMetadata>? blocks,
    $core.String? title,
    $core.String? titleEn,
    $core.int? date,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (build != null) {
      $result.build = build;
    }
    if (originalUrl != null) {
      $result.originalUrl = originalUrl;
    }
    if (compressed != null) {
      $result.compressed = compressed;
    }
    if (bboxLatLon != null) {
      $result.bboxLatLon.addAll(bboxLatLon);
    }
    if (blocks != null) {
      $result.blocks.addAll(blocks);
    }
    if (title != null) {
      $result.title = title;
    }
    if (titleEn != null) {
      $result.titleEn = titleEn;
    }
    if (date != null) {
      $result.date = date;
    }
    return $result;
  }
  Footer._() : super();
  factory Footer.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Footer.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Footer', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'build', $pb.PbFieldType.OU3)
    ..aOS(3, _omitFieldNames ? '' : 'originalUrl')
    ..aOB(4, _omitFieldNames ? '' : 'compressed')
    ..p<$core.int>(5, _omitFieldNames ? '' : 'bboxLatLon', $pb.PbFieldType.KS3)
    ..pc<BlockMetadata>(6, _omitFieldNames ? '' : 'blocks', $pb.PbFieldType.PM, subBuilder: BlockMetadata.create)
    ..aOS(7, _omitFieldNames ? '' : 'title')
    ..aOS(8, _omitFieldNames ? '' : 'titleEn')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'date', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Footer clone() => Footer()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Footer copyWith(void Function(Footer) updates) => super.copyWith((message) => updates(message as Footer)) as Footer;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Footer create() => Footer._();
  Footer createEmptyInstance() => create();
  static $pb.PbList<Footer> createRepeated() => $pb.PbList<Footer>();
  @$core.pragma('dart2js:noInline')
  static Footer getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Footer>(create);
  static Footer? _defaultInstance;

  /// Version of the schema. When it's bigger than supported,
  /// assume you cannot read the rest of the file.
  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  /// A release number for the feed. The only requirement
  /// is that newer feeds should have this number greater than the older.
  @$pb.TagNumber(2)
  $core.int get build => $_getIZ(1);
  @$pb.TagNumber(2)
  set build($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBuild() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuild() => clearField(2);

  /// In case of errors, this would be the reference GTFS feed, zip file itself.
  /// Please link to specific builds if possible, e.g. "20240319", not "latest".
  @$pb.TagNumber(3)
  $core.String get originalUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set originalUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOriginalUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearOriginalUrl() => clearField(3);

  /// If true, all blocks are compressed with Zstandard by default.
  /// Including all metadata blocks.
  @$pb.TagNumber(4)
  $core.bool get compressed => $_getBF(3);
  @$pb.TagNumber(4)
  set compressed($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompressed() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompressed() => clearField(4);

  /// Four integers, coordinated multiplied by 100. First two are lat and lon
  /// of the south-western corner rounded down, other are for the NE corner rounded up.
  @$pb.TagNumber(5)
  $core.List<$core.int> get bboxLatLon => $_getList(4);

  /// The rest of the file is blocks in random order.
  @$pb.TagNumber(6)
  $core.List<BlockMetadata> get blocks => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get title => $_getSZ(6);
  @$pb.TagNumber(7)
  set title($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTitle() => $_has(6);
  @$pb.TagNumber(7)
  void clearTitle() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get titleEn => $_getSZ(7);
  @$pb.TagNumber(8)
  set titleEn($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTitleEn() => $_has(7);
  @$pb.TagNumber(8)
  void clearTitleEn() => clearField(8);

  /// Date when the original GTFS feed was built, in YYMMDD format (240319).
  @$pb.TagNumber(9)
  $core.int get date => $_getIZ(8);
  @$pb.TagNumber(9)
  set date($core.int v) { $_setUnsignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearDate() => clearField(9);
}

class BlockMetadata extends $pb.GeneratedMessage {
  factory BlockMetadata({
    Block? block,
    $fixnum.Int64? offset,
    $core.int? length,
    $core.bool? compressed,
  }) {
    final $result = create();
    if (block != null) {
      $result.block = block;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    if (length != null) {
      $result.length = length;
    }
    if (compressed != null) {
      $result.compressed = compressed;
    }
    return $result;
  }
  BlockMetadata._() : super();
  factory BlockMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BlockMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BlockMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..e<Block>(1, _omitFieldNames ? '' : 'block', $pb.PbFieldType.OE, defaultOrMaker: Block.B_UNKNOWN, valueOf: Block.valueOf, enumValues: Block.values)
    ..a<$fixnum.Int64>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'length', $pb.PbFieldType.OU3)
    ..aOB(4, _omitFieldNames ? '' : 'compressed')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BlockMetadata clone() => BlockMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BlockMetadata copyWith(void Function(BlockMetadata) updates) => super.copyWith((message) => updates(message as BlockMetadata)) as BlockMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BlockMetadata create() => BlockMetadata._();
  BlockMetadata createEmptyInstance() => create();
  static $pb.PbList<BlockMetadata> createRepeated() => $pb.PbList<BlockMetadata>();
  @$core.pragma('dart2js:noInline')
  static BlockMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BlockMetadata>(create);
  static BlockMetadata? _defaultInstance;

  /// Type of the block.
  @$pb.TagNumber(1)
  Block get block => $_getN(0);
  @$pb.TagNumber(1)
  set block(Block v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBlock() => $_has(0);
  @$pb.TagNumber(1)
  void clearBlock() => clearField(1);

  /// Offset of the first byte in the file.
  @$pb.TagNumber(2)
  $fixnum.Int64 get offset => $_getI64(1);
  @$pb.TagNumber(2)
  set offset($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => clearField(2);

  /// Length of the metadata message.
  @$pb.TagNumber(3)
  $core.int get length => $_getIZ(2);
  @$pb.TagNumber(3)
  set length($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLength() => $_has(2);
  @$pb.TagNumber(3)
  void clearLength() => clearField(3);

  /// Whether the metadata message is compressed.
  @$pb.TagNumber(4)
  $core.bool get compressed => $_getBF(3);
  @$pb.TagNumber(4)
  set compressed($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCompressed() => $_has(3);
  @$pb.TagNumber(4)
  void clearCompressed() => clearField(4);
}

/// Included here because it's the source for time zones and URLs.
/// Enumerated from zero, like array indices.
class Agencies extends $pb.GeneratedMessage {
  factory Agencies({
    $core.Iterable<Agency>? agencies,
    $core.Iterable<$core.String>? ticketInfo,
    $core.Iterable<Realtime>? realtime,
  }) {
    final $result = create();
    if (agencies != null) {
      $result.agencies.addAll(agencies);
    }
    if (ticketInfo != null) {
      $result.ticketInfo.addAll(ticketInfo);
    }
    if (realtime != null) {
      $result.realtime.addAll(realtime);
    }
    return $result;
  }
  Agencies._() : super();
  factory Agencies.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Agencies.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Agencies', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..pc<Agency>(1, _omitFieldNames ? '' : 'agencies', $pb.PbFieldType.PM, subBuilder: Agency.create)
    ..pPS(2, _omitFieldNames ? '' : 'ticketInfo')
    ..pc<Realtime>(3, _omitFieldNames ? '' : 'realtime', $pb.PbFieldType.PM, subBuilder: Realtime.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Agencies clone() => Agencies()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Agencies copyWith(void Function(Agencies) updates) => super.copyWith((message) => updates(message as Agencies)) as Agencies;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Agencies create() => Agencies._();
  Agencies createEmptyInstance() => create();
  static $pb.PbList<Agencies> createRepeated() => $pb.PbList<Agencies>();
  @$core.pragma('dart2js:noInline')
  static Agencies getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Agencies>(create);
  static Agencies? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Agency> get agencies => $_getList(0);

  /// Markdown-formatted instructions in English on buying tickets and riding.
  @$pb.TagNumber(2)
  $core.List<$core.String> get ticketInfo => $_getList(1);

  /// Links to the real-time information.
  @$pb.TagNumber(3)
  $core.List<Realtime> get realtime => $_getList(2);
}

class Agency extends $pb.GeneratedMessage {
  factory Agency({
    $core.String? name,
    $core.String? url,
    $core.String? timezone,
    $core.String? lang,
    $core.String? phone,
    $core.String? fareUrl,
    $core.String? email,
    $core.int? ticketInfo,
    $core.Iterable<$core.int>? realtime,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (url != null) {
      $result.url = url;
    }
    if (timezone != null) {
      $result.timezone = timezone;
    }
    if (lang != null) {
      $result.lang = lang;
    }
    if (phone != null) {
      $result.phone = phone;
    }
    if (fareUrl != null) {
      $result.fareUrl = fareUrl;
    }
    if (email != null) {
      $result.email = email;
    }
    if (ticketInfo != null) {
      $result.ticketInfo = ticketInfo;
    }
    if (realtime != null) {
      $result.realtime.addAll(realtime);
    }
    return $result;
  }
  Agency._() : super();
  factory Agency.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Agency.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Agency', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..aOS(3, _omitFieldNames ? '' : 'timezone')
    ..aOS(4, _omitFieldNames ? '' : 'lang')
    ..aOS(5, _omitFieldNames ? '' : 'phone')
    ..aOS(6, _omitFieldNames ? '' : 'fareUrl')
    ..aOS(7, _omitFieldNames ? '' : 'email')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'ticketInfo', $pb.PbFieldType.OU3)
    ..p<$core.int>(9, _omitFieldNames ? '' : 'realtime', $pb.PbFieldType.KU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Agency clone() => Agency()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Agency copyWith(void Function(Agency) updates) => super.copyWith((message) => updates(message as Agency)) as Agency;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Agency create() => Agency._();
  Agency createEmptyInstance() => create();
  static $pb.PbList<Agency> createRepeated() => $pb.PbList<Agency>();
  @$core.pragma('dart2js:noInline')
  static Agency getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Agency>(create);
  static Agency? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get timezone => $_getSZ(2);
  @$pb.TagNumber(3)
  set timezone($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTimezone() => $_has(2);
  @$pb.TagNumber(3)
  void clearTimezone() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get lang => $_getSZ(3);
  @$pb.TagNumber(4)
  set lang($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLang() => $_has(3);
  @$pb.TagNumber(4)
  void clearLang() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get phone => $_getSZ(4);
  @$pb.TagNumber(5)
  set phone($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPhone() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhone() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get fareUrl => $_getSZ(5);
  @$pb.TagNumber(6)
  set fareUrl($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFareUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearFareUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get email => $_getSZ(6);
  @$pb.TagNumber(7)
  set email($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasEmail() => $_has(6);
  @$pb.TagNumber(7)
  void clearEmail() => clearField(7);

  /// index + 1 from Agencies.ticket_info
  @$pb.TagNumber(8)
  $core.int get ticketInfo => $_getIZ(7);
  @$pb.TagNumber(8)
  set ticketInfo($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTicketInfo() => $_has(7);
  @$pb.TagNumber(8)
  void clearTicketInfo() => clearField(8);

  /// index + 1 from Agencies.realtime. There can be multiple (e.g. vehicle positions + delays)
  @$pb.TagNumber(9)
  $core.List<$core.int> get realtime => $_getList(8);
}

class Realtime extends $pb.GeneratedMessage {
  factory Realtime({
    RealtimeType? type,
    $core.String? url,
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  Realtime._() : super();
  factory Realtime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Realtime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Realtime', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..e<RealtimeType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: RealtimeType.RT_UNKNOWN, valueOf: RealtimeType.valueOf, enumValues: RealtimeType.values)
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Realtime clone() => Realtime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Realtime copyWith(void Function(Realtime) updates) => super.copyWith((message) => updates(message as Realtime)) as Realtime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Realtime create() => Realtime._();
  Realtime createEmptyInstance() => create();
  static $pb.PbList<Realtime> createRepeated() => $pb.PbList<Realtime>();
  @$core.pragma('dart2js:noInline')
  static Realtime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Realtime>(create);
  static Realtime? _defaultInstance;

  @$pb.TagNumber(1)
  RealtimeType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(RealtimeType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

/// This is the simplest block. Shape messages immediately follow the
/// metadata block and ordered by their ids.
class ShapeMetadata extends $pb.GeneratedMessage {
  factory ShapeMetadata({
    $core.int? chunkSize,
    $core.Iterable<$core.int>? chunkLengths,
  }) {
    final $result = create();
    if (chunkSize != null) {
      $result.chunkSize = chunkSize;
    }
    if (chunkLengths != null) {
      $result.chunkLengths.addAll(chunkLengths);
    }
    return $result;
  }
  ShapeMetadata._() : super();
  factory ShapeMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShapeMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShapeMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'chunkSize', $pb.PbFieldType.OU3)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'chunkLengths', $pb.PbFieldType.KU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShapeMetadata clone() => ShapeMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShapeMetadata copyWith(void Function(ShapeMetadata) updates) => super.copyWith((message) => updates(message as ShapeMetadata)) as ShapeMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShapeMetadata create() => ShapeMetadata._();
  ShapeMetadata createEmptyInstance() => create();
  static $pb.PbList<ShapeMetadata> createRepeated() => $pb.PbList<ShapeMetadata>();
  @$core.pragma('dart2js:noInline')
  static ShapeMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShapeMetadata>(create);
  static ShapeMetadata? _defaultInstance;

  /// Shapes can be grouped into chunks to compress them more effectively.
  /// All chunks are of the same size. Should be at least 1.
  @$pb.TagNumber(1)
  $core.int get chunkSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set chunkSize($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasChunkSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearChunkSize() => clearField(1);

  /// Sizes in bytes for each consequtive chunk. Note that those are compressed
  /// sizes. You can get an offset by adding this block offset, this block length,
  /// and all chunk length from 0 up until the preceding one.
  @$pb.TagNumber(2)
  $core.List<$core.int> get chunkLengths => $_getList(1);
}

/// Sequence of shapes in a chunk. Follows ShapeMetadata, not included in it.
class ShapeChunk extends $pb.GeneratedMessage {
  factory ShapeChunk({
    $core.Iterable<Shape>? shapes,
  }) {
    final $result = create();
    if (shapes != null) {
      $result.shapes.addAll(shapes);
    }
    return $result;
  }
  ShapeChunk._() : super();
  factory ShapeChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ShapeChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ShapeChunk', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..pc<Shape>(1, _omitFieldNames ? '' : 'shapes', $pb.PbFieldType.PM, subBuilder: Shape.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ShapeChunk clone() => ShapeChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ShapeChunk copyWith(void Function(ShapeChunk) updates) => super.copyWith((message) => updates(message as ShapeChunk)) as ShapeChunk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ShapeChunk create() => ShapeChunk._();
  ShapeChunk createEmptyInstance() => create();
  static $pb.PbList<ShapeChunk> createRepeated() => $pb.PbList<ShapeChunk>();
  @$core.pragma('dart2js:noInline')
  static ShapeChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ShapeChunk>(create);
  static ShapeChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Shape> get shapes => $_getList(0);
}

/// A single shape. Its identifier is its number in file, starting from 1.
class Shape extends $pb.GeneratedMessage {
  factory Shape({
    $core.Iterable<$core.int>? longitudes,
    $core.Iterable<$core.int>? latitudes,
  }) {
    final $result = create();
    if (longitudes != null) {
      $result.longitudes.addAll(longitudes);
    }
    if (latitudes != null) {
      $result.latitudes.addAll(latitudes);
    }
    return $result;
  }
  Shape._() : super();
  factory Shape.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Shape.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Shape', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'longitudes', $pb.PbFieldType.KS3)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'latitudes', $pb.PbFieldType.KS3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Shape clone() => Shape()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Shape copyWith(void Function(Shape) updates) => super.copyWith((message) => updates(message as Shape)) as Shape;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Shape create() => Shape._();
  Shape createEmptyInstance() => create();
  static $pb.PbList<Shape> createRepeated() => $pb.PbList<Shape>();
  @$core.pragma('dart2js:noInline')
  static Shape getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Shape>(create);
  static Shape? _defaultInstance;

  /// Numbers multiplied by 100000 (1e5) and rounded.
  /// Mind the accumulated rounding error!
  /// Each number is the difference with the last.
  @$pb.TagNumber(1)
  $core.List<$core.int> get longitudes => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get latitudes => $_getList(1);
}

/// Stops are split into chunks for 24-bit geohashes to speed up retrieval.
/// For stops within stations, the station geohash is used for chunking.
class StopMetadata extends $pb.GeneratedMessage {
  factory StopMetadata({
    $core.int? geohashXor,
    $core.Iterable<$core.int>? geohashes,
    $core.Iterable<$core.int>? chunkLengths,
    $core.Iterable<$core.int>? chunkStopCounts,
    $core.bool? hasStations,
    $core.bool? hasDirections,
  }) {
    final $result = create();
    if (geohashXor != null) {
      $result.geohashXor = geohashXor;
    }
    if (geohashes != null) {
      $result.geohashes.addAll(geohashes);
    }
    if (chunkLengths != null) {
      $result.chunkLengths.addAll(chunkLengths);
    }
    if (chunkStopCounts != null) {
      $result.chunkStopCounts.addAll(chunkStopCounts);
    }
    if (hasStations != null) {
      $result.hasStations = hasStations;
    }
    if (hasDirections != null) {
      $result.hasDirections = hasDirections;
    }
    return $result;
  }
  StopMetadata._() : super();
  factory StopMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StopMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StopMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'geohashXor', $pb.PbFieldType.OU3)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'geohashes', $pb.PbFieldType.KU3)
    ..p<$core.int>(3, _omitFieldNames ? '' : 'chunkLengths', $pb.PbFieldType.KS3)
    ..p<$core.int>(4, _omitFieldNames ? '' : 'chunkStopCounts', $pb.PbFieldType.KU3)
    ..aOB(5, _omitFieldNames ? '' : 'hasStations')
    ..aOB(6, _omitFieldNames ? '' : 'hasDirections')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StopMetadata clone() => StopMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StopMetadata copyWith(void Function(StopMetadata) updates) => super.copyWith((message) => updates(message as StopMetadata)) as StopMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopMetadata create() => StopMetadata._();
  StopMetadata createEmptyInstance() => create();
  static $pb.PbList<StopMetadata> createRepeated() => $pb.PbList<StopMetadata>();
  @$core.pragma('dart2js:noInline')
  static StopMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StopMetadata>(create);
  static StopMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get geohashXor => $_getIZ(0);
  @$pb.TagNumber(1)
  set geohashXor($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGeohashXor() => $_has(0);
  @$pb.TagNumber(1)
  void clearGeohashXor() => clearField(1);

  /// Delta-coded geohashes. Should be XOR-ed with geohash_xor.
  @$pb.TagNumber(2)
  $core.List<$core.int> get geohashes => $_getList(1);

  /// In bytes. Negative if not compressed (but everything else is).
  @$pb.TagNumber(3)
  $core.List<$core.int> get chunkLengths => $_getList(2);

  /// This field helps look up stop_id → chunk + index in the chunk.
  @$pb.TagNumber(4)
  $core.List<$core.int> get chunkStopCounts => $_getList(3);

  /// If false, is_station and parent_id in chunks are skipped.
  @$pb.TagNumber(5)
  $core.bool get hasStations => $_getBF(4);
  @$pb.TagNumber(5)
  set hasStations($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHasStations() => $_has(4);
  @$pb.TagNumber(5)
  void clearHasStations() => clearField(5);

  /// If false, the direction in chunks is skipped.
  @$pb.TagNumber(6)
  $core.bool get hasDirections => $_getBF(5);
  @$pb.TagNumber(6)
  set hasDirections($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasHasDirections() => $_has(5);
  @$pb.TagNumber(6)
  void clearHasDirections() => clearField(6);
}

///  Column-oriented set of stops. Which means, it's a set
///  of packed column values. E.g. the code field contains strings
///  for every stop in the chunk.
///
///  Even if packing everything in a single field, having lengths in those
///  would mean adding 30 bytes to every stop,
///  which might mean over 3 MB for a feed. Hence we process the binary
///  data directly. This message is not used, but demonstrates an order and
///  types of fields.
class StopsChunk extends $pb.GeneratedMessage {
  factory StopsChunk({
    $core.String? gtfsId,
    $core.String? code,
    $core.String? name,
    $core.String? desc,
    $core.int? lat,
    $core.int? lon,
    Accessibility? wheelchair,
    $core.Iterable<$core.int>? routeIds,
    $core.bool? isStation,
    $core.int? parentId,
    Direction? direction,
    $core.int? geohash,
  }) {
    final $result = create();
    if (gtfsId != null) {
      $result.gtfsId = gtfsId;
    }
    if (code != null) {
      $result.code = code;
    }
    if (name != null) {
      $result.name = name;
    }
    if (desc != null) {
      $result.desc = desc;
    }
    if (lat != null) {
      $result.lat = lat;
    }
    if (lon != null) {
      $result.lon = lon;
    }
    if (wheelchair != null) {
      $result.wheelchair = wheelchair;
    }
    if (routeIds != null) {
      $result.routeIds.addAll(routeIds);
    }
    if (isStation != null) {
      $result.isStation = isStation;
    }
    if (parentId != null) {
      $result.parentId = parentId;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (geohash != null) {
      $result.geohash = geohash;
    }
    return $result;
  }
  StopsChunk._() : super();
  factory StopsChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StopsChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StopsChunk', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'gtfsId')
    ..aOS(2, _omitFieldNames ? '' : 'code')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'desc')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'lat', $pb.PbFieldType.OS3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'lon', $pb.PbFieldType.OS3)
    ..e<Accessibility>(7, _omitFieldNames ? '' : 'wheelchair', $pb.PbFieldType.OE, defaultOrMaker: Accessibility.A_UNKNOWN, valueOf: Accessibility.valueOf, enumValues: Accessibility.values)
    ..p<$core.int>(8, _omitFieldNames ? '' : 'routeIds', $pb.PbFieldType.KU3)
    ..aOB(9, _omitFieldNames ? '' : 'isStation')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'parentId', $pb.PbFieldType.OU3)
    ..e<Direction>(11, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.OE, defaultOrMaker: Direction.D_UNKNOWN, valueOf: Direction.valueOf, enumValues: Direction.values)
    ..a<$core.int>(30, _omitFieldNames ? '' : 'geohash', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StopsChunk clone() => StopsChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StopsChunk copyWith(void Function(StopsChunk) updates) => super.copyWith((message) => updates(message as StopsChunk)) as StopsChunk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopsChunk create() => StopsChunk._();
  StopsChunk createEmptyInstance() => create();
  static $pb.PbList<StopsChunk> createRepeated() => $pb.PbList<StopsChunk>();
  @$core.pragma('dart2js:noInline')
  static StopsChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StopsChunk>(create);
  static StopsChunk? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get gtfsId => $_getSZ(0);
  @$pb.TagNumber(1)
  set gtfsId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasGtfsId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGtfsId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get code => $_getSZ(1);
  @$pb.TagNumber(2)
  set code($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearCode() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get desc => $_getSZ(3);
  @$pb.TagNumber(4)
  set desc($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDesc() => $_has(3);
  @$pb.TagNumber(4)
  void clearDesc() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get lat => $_getIZ(4);
  @$pb.TagNumber(5)
  set lat($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLat() => $_has(4);
  @$pb.TagNumber(5)
  void clearLat() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get lon => $_getIZ(5);
  @$pb.TagNumber(6)
  set lon($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLon() => $_has(5);
  @$pb.TagNumber(6)
  void clearLon() => clearField(6);

  /// This field is bit-packed (2 bits each, 0b00112233 for 0,1,2,3).
  @$pb.TagNumber(7)
  Accessibility get wheelchair => $_getN(6);
  @$pb.TagNumber(7)
  set wheelchair(Accessibility v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasWheelchair() => $_has(6);
  @$pb.TagNumber(7)
  void clearWheelchair() => clearField(7);

  @$pb.TagNumber(8)
  $core.List<$core.int> get routeIds => $_getList(7);

  /// Those two are skipped if has_stations is false.
  @$pb.TagNumber(9)
  $core.bool get isStation => $_getBF(8);
  @$pb.TagNumber(9)
  set isStation($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasIsStation() => $_has(8);
  @$pb.TagNumber(9)
  void clearIsStation() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get parentId => $_getIZ(9);
  @$pb.TagNumber(10)
  set parentId($core.int v) { $_setUnsignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasParentId() => $_has(9);
  @$pb.TagNumber(10)
  void clearParentId() => clearField(10);

  @$pb.TagNumber(11)
  Direction get direction => $_getN(10);
  @$pb.TagNumber(11)
  set direction(Direction v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasDirection() => $_has(10);
  @$pb.TagNumber(11)
  void clearDirection() => clearField(11);

  @$pb.TagNumber(30)
  $core.int get geohash => $_getIZ(11);
  @$pb.TagNumber(30)
  set geohash($core.int v) { $_setUnsignedInt32(11, v); }
  @$pb.TagNumber(30)
  $core.bool hasGeohash() => $_has(11);
  @$pb.TagNumber(30)
  void clearGeohash() => clearField(30);
}

/// Unlike other blocks, this one is completely contained in the metadata.
class LookupMetadata extends $pb.GeneratedMessage {
  factory LookupMetadata({
    StopLookup? stopByName,
    StopLookup? stopByGtfsId,
    StopLookup? routeByGtfsId,
  }) {
    final $result = create();
    if (stopByName != null) {
      $result.stopByName = stopByName;
    }
    if (stopByGtfsId != null) {
      $result.stopByGtfsId = stopByGtfsId;
    }
    if (routeByGtfsId != null) {
      $result.routeByGtfsId = routeByGtfsId;
    }
    return $result;
  }
  LookupMetadata._() : super();
  factory LookupMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LookupMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LookupMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..aOM<StopLookup>(1, _omitFieldNames ? '' : 'stopByName', subBuilder: StopLookup.create)
    ..aOM<StopLookup>(2, _omitFieldNames ? '' : 'stopByGtfsId', subBuilder: StopLookup.create)
    ..aOM<StopLookup>(3, _omitFieldNames ? '' : 'routeByGtfsId', subBuilder: StopLookup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LookupMetadata clone() => LookupMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LookupMetadata copyWith(void Function(LookupMetadata) updates) => super.copyWith((message) => updates(message as LookupMetadata)) as LookupMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LookupMetadata create() => LookupMetadata._();
  LookupMetadata createEmptyInstance() => create();
  static $pb.PbList<LookupMetadata> createRepeated() => $pb.PbList<LookupMetadata>();
  @$core.pragma('dart2js:noInline')
  static LookupMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LookupMetadata>(create);
  static LookupMetadata? _defaultInstance;

  @$pb.TagNumber(1)
  StopLookup get stopByName => $_getN(0);
  @$pb.TagNumber(1)
  set stopByName(StopLookup v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStopByName() => $_has(0);
  @$pb.TagNumber(1)
  void clearStopByName() => clearField(1);
  @$pb.TagNumber(1)
  StopLookup ensureStopByName() => $_ensure(0);

  @$pb.TagNumber(2)
  StopLookup get stopByGtfsId => $_getN(1);
  @$pb.TagNumber(2)
  set stopByGtfsId(StopLookup v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStopByGtfsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStopByGtfsId() => clearField(2);
  @$pb.TagNumber(2)
  StopLookup ensureStopByGtfsId() => $_ensure(1);

  @$pb.TagNumber(3)
  StopLookup get routeByGtfsId => $_getN(2);
  @$pb.TagNumber(3)
  set routeByGtfsId(StopLookup v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasRouteByGtfsId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRouteByGtfsId() => clearField(3);
  @$pb.TagNumber(3)
  StopLookup ensureRouteByGtfsId() => $_ensure(2);
}

/// Encodes a radix trie structure.
class StopLookup extends $pb.GeneratedMessage {
  factory StopLookup({
    $core.List<$core.int>? stringBlob,
    $core.Iterable<$core.int>? stopIds,
    $core.Iterable<$core.int>? nodeEdgeOffset,
    $core.Iterable<$core.int>? nodeEdgeCount,
    $core.Iterable<$core.int>? nodeStopOffset,
    $core.Iterable<$core.int>? nodeStopCount,
    $core.Iterable<$core.int>? edgeLabelOffset,
    $core.Iterable<$core.int>? edgeLabelLength,
    $core.Iterable<$core.int>? edgeNodeIndex,
  }) {
    final $result = create();
    if (stringBlob != null) {
      $result.stringBlob = stringBlob;
    }
    if (stopIds != null) {
      $result.stopIds.addAll(stopIds);
    }
    if (nodeEdgeOffset != null) {
      $result.nodeEdgeOffset.addAll(nodeEdgeOffset);
    }
    if (nodeEdgeCount != null) {
      $result.nodeEdgeCount.addAll(nodeEdgeCount);
    }
    if (nodeStopOffset != null) {
      $result.nodeStopOffset.addAll(nodeStopOffset);
    }
    if (nodeStopCount != null) {
      $result.nodeStopCount.addAll(nodeStopCount);
    }
    if (edgeLabelOffset != null) {
      $result.edgeLabelOffset.addAll(edgeLabelOffset);
    }
    if (edgeLabelLength != null) {
      $result.edgeLabelLength.addAll(edgeLabelLength);
    }
    if (edgeNodeIndex != null) {
      $result.edgeNodeIndex.addAll(edgeNodeIndex);
    }
    return $result;
  }
  StopLookup._() : super();
  factory StopLookup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory StopLookup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'StopLookup', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'stringBlob', $pb.PbFieldType.OY)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'stopIds', $pb.PbFieldType.KU3)
    ..p<$core.int>(3, _omitFieldNames ? '' : 'nodeEdgeOffset', $pb.PbFieldType.KU3)
    ..p<$core.int>(4, _omitFieldNames ? '' : 'nodeEdgeCount', $pb.PbFieldType.KU3)
    ..p<$core.int>(5, _omitFieldNames ? '' : 'nodeStopOffset', $pb.PbFieldType.KU3)
    ..p<$core.int>(6, _omitFieldNames ? '' : 'nodeStopCount', $pb.PbFieldType.KU3)
    ..p<$core.int>(7, _omitFieldNames ? '' : 'edgeLabelOffset', $pb.PbFieldType.KU3)
    ..p<$core.int>(8, _omitFieldNames ? '' : 'edgeLabelLength', $pb.PbFieldType.KU3)
    ..p<$core.int>(9, _omitFieldNames ? '' : 'edgeNodeIndex', $pb.PbFieldType.KU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  StopLookup clone() => StopLookup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  StopLookup copyWith(void Function(StopLookup) updates) => super.copyWith((message) => updates(message as StopLookup)) as StopLookup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StopLookup create() => StopLookup._();
  StopLookup createEmptyInstance() => create();
  static $pb.PbList<StopLookup> createRepeated() => $pb.PbList<StopLookup>();
  @$core.pragma('dart2js:noInline')
  static StopLookup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<StopLookup>(create);
  static StopLookup? _defaultInstance;

  /// Edges reference this blob.
  @$pb.TagNumber(1)
  $core.List<$core.int> get stringBlob => $_getN(0);
  @$pb.TagNumber(1)
  set stringBlob($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStringBlob() => $_has(0);
  @$pb.TagNumber(1)
  void clearStringBlob() => clearField(1);

  /// Nodes reference stop ids, which are ordered for convenient lookup.
  @$pb.TagNumber(2)
  $core.List<$core.int> get stopIds => $_getList(1);

  /// Nodes in the graph, split into columns to compress better.
  @$pb.TagNumber(3)
  $core.List<$core.int> get nodeEdgeOffset => $_getList(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get nodeEdgeCount => $_getList(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get nodeStopOffset => $_getList(4);

  @$pb.TagNumber(6)
  $core.List<$core.int> get nodeStopCount => $_getList(5);

  /// Edges in the graph.
  @$pb.TagNumber(7)
  $core.List<$core.int> get edgeLabelOffset => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get edgeLabelLength => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$core.int> get edgeNodeIndex => $_getList(8);
}

class CalendarMetadata extends $pb.GeneratedMessage {
  factory CalendarMetadata({
    $core.int? baseDate,
    $core.Iterable<$core.int>? startDates,
    $core.Iterable<$core.int>? endDates,
    $core.Iterable<$core.int>? weekdays,
    $core.int? daysInMonth,
    $core.Iterable<$core.int>? monthLengths,
  }) {
    final $result = create();
    if (baseDate != null) {
      $result.baseDate = baseDate;
    }
    if (startDates != null) {
      $result.startDates.addAll(startDates);
    }
    if (endDates != null) {
      $result.endDates.addAll(endDates);
    }
    if (weekdays != null) {
      $result.weekdays.addAll(weekdays);
    }
    if (daysInMonth != null) {
      $result.daysInMonth = daysInMonth;
    }
    if (monthLengths != null) {
      $result.monthLengths.addAll(monthLengths);
    }
    return $result;
  }
  CalendarMetadata._() : super();
  factory CalendarMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalendarMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalendarMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'baseDate', $pb.PbFieldType.OU3)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'startDates', $pb.PbFieldType.KU3)
    ..p<$core.int>(3, _omitFieldNames ? '' : 'endDates', $pb.PbFieldType.KU3)
    ..p<$core.int>(4, _omitFieldNames ? '' : 'weekdays', $pb.PbFieldType.KU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'daysInMonth', $pb.PbFieldType.OU3)
    ..p<$core.int>(6, _omitFieldNames ? '' : 'monthLengths', $pb.PbFieldType.KS3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalendarMetadata clone() => CalendarMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalendarMetadata copyWith(void Function(CalendarMetadata) updates) => super.copyWith((message) => updates(message as CalendarMetadata)) as CalendarMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalendarMetadata create() => CalendarMetadata._();
  CalendarMetadata createEmptyInstance() => create();
  static $pb.PbList<CalendarMetadata> createRepeated() => $pb.PbList<CalendarMetadata>();
  @$core.pragma('dart2js:noInline')
  static CalendarMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalendarMetadata>(create);
  static CalendarMetadata? _defaultInstance;

  /// A number as YYMMDD: e.g. 240821.
  /// The year is ±5 years from today, error otherwise.
  /// All service dates use offsets in days from it.
  @$pb.TagNumber(1)
  $core.int get baseDate => $_getIZ(0);
  @$pb.TagNumber(1)
  set baseDate($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBaseDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearBaseDate() => clearField(1);

  /// Start dates for every service. First is offset from base_date,
  /// second and others are deltas from previous. Services should be sorted
  /// by start_date, so every number in this list is positive.
  @$pb.TagNumber(2)
  $core.List<$core.int> get startDates => $_getList(1);

  /// End dates for every service, difference with start_date.
  @$pb.TagNumber(3)
  $core.List<$core.int> get endDates => $_getList(2);

  /// Bit-encoded weekdays for every service, sequentially.
  /// One byte is one service. Zeroes for non-weekday-based services.
  /// Bit 0 is Monday, 6 is Sunday: 0b0SSFTWTM. 0x60 is weekends.
  @$pb.TagNumber(4)
  $core.List<$core.int> get weekdays => $_getList(3);

  /// This message is followed by a series of CalendarMonth chunks.
  /// Despite the name, those can contain arbitrary number of days.
  /// The first "month" starts at the base_date and goes on incrementally.
  @$pb.TagNumber(5)
  $core.int get daysInMonth => $_getIZ(4);
  @$pb.TagNumber(5)
  set daysInMonth($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDaysInMonth() => $_has(4);
  @$pb.TagNumber(5)
  void clearDaysInMonth() => clearField(5);

  /// Compressed length in bytes for each consequtive "month" chunk.
  /// Can be zero for some months. Negative if not compressed.
  /// We package at most a year of dates.
  @$pb.TagNumber(6)
  $core.List<$core.int> get monthLengths => $_getList(5);
}

/// These follow the CalendarMetadata, not attached to messages.
class CalendarMonth extends $pb.GeneratedMessage {
  factory CalendarMonth({
    $core.Iterable<$core.int>? dateOffsets,
    $core.Iterable<CalendarDate>? dates,
  }) {
    final $result = create();
    if (dateOffsets != null) {
      $result.dateOffsets.addAll(dateOffsets);
    }
    if (dates != null) {
      $result.dates.addAll(dates);
    }
    return $result;
  }
  CalendarMonth._() : super();
  factory CalendarMonth.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalendarMonth.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalendarMonth', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'dateOffsets', $pb.PbFieldType.KU3)
    ..pc<CalendarDate>(2, _omitFieldNames ? '' : 'dates', $pb.PbFieldType.PM, subBuilder: CalendarDate.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalendarMonth clone() => CalendarMonth()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalendarMonth copyWith(void Function(CalendarMonth) updates) => super.copyWith((message) => updates(message as CalendarMonth)) as CalendarMonth;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalendarMonth create() => CalendarMonth._();
  CalendarMonth createEmptyInstance() => create();
  static $pb.PbList<CalendarMonth> createRepeated() => $pb.PbList<CalendarMonth>();
  @$core.pragma('dart2js:noInline')
  static CalendarMonth getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalendarMonth>(create);
  static CalendarMonth? _defaultInstance;

  /// Delta coded, first date is offset from the months start.
  /// Default is [0, 1, 1, 1, ...]. Cut on the last non-default value.
  @$pb.TagNumber(1)
  $core.List<$core.int> get dateOffsets => $_getList(0);

  @$pb.TagNumber(2)
  $core.List<CalendarDate> get dates => $_getList(1);
}

class CalendarDate extends $pb.GeneratedMessage {
  factory CalendarDate({
    $core.Iterable<$core.int>? includedIn,
    $core.Iterable<$core.int>? exceptionIn,
  }) {
    final $result = create();
    if (includedIn != null) {
      $result.includedIn.addAll(includedIn);
    }
    if (exceptionIn != null) {
      $result.exceptionIn.addAll(exceptionIn);
    }
    return $result;
  }
  CalendarDate._() : super();
  factory CalendarDate.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CalendarDate.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CalendarDate', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'includedIn', $pb.PbFieldType.KU3)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'exceptionIn', $pb.PbFieldType.KU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CalendarDate clone() => CalendarDate()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CalendarDate copyWith(void Function(CalendarDate) updates) => super.copyWith((message) => updates(message as CalendarDate)) as CalendarDate;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CalendarDate create() => CalendarDate._();
  CalendarDate createEmptyInstance() => create();
  static $pb.PbList<CalendarDate> createRepeated() => $pb.PbList<CalendarDate>();
  @$core.pragma('dart2js:noInline')
  static CalendarDate getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CalendarDate>(create);
  static CalendarDate? _defaultInstance;

  /// List of service ids incrementally, delta-coded.
  @$pb.TagNumber(1)
  $core.List<$core.int> get includedIn => $_getList(0);

  /// List of serivce ids incrementally, delta-coded.
  @$pb.TagNumber(2)
  $core.List<$core.int> get exceptionIn => $_getList(1);
}

class RouteMetadata extends $pb.GeneratedMessage {
  factory RouteMetadata({
    $core.Iterable<$core.int>? routeLengths,
    $core.bool? hasWheelchairInfo,
    $core.bool? hasBikeInfo,
  }) {
    final $result = create();
    if (routeLengths != null) {
      $result.routeLengths.addAll(routeLengths);
    }
    if (hasWheelchairInfo != null) {
      $result.hasWheelchairInfo = hasWheelchairInfo;
    }
    if (hasBikeInfo != null) {
      $result.hasBikeInfo = hasBikeInfo;
    }
    return $result;
  }
  RouteMetadata._() : super();
  factory RouteMetadata.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RouteMetadata.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RouteMetadata', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'routeLengths', $pb.PbFieldType.KU3)
    ..aOB(2, _omitFieldNames ? '' : 'hasWheelchairInfo')
    ..aOB(3, _omitFieldNames ? '' : 'hasBikeInfo')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RouteMetadata clone() => RouteMetadata()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RouteMetadata copyWith(void Function(RouteMetadata) updates) => super.copyWith((message) => updates(message as RouteMetadata)) as RouteMetadata;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RouteMetadata create() => RouteMetadata._();
  RouteMetadata createEmptyInstance() => create();
  static $pb.PbList<RouteMetadata> createRepeated() => $pb.PbList<RouteMetadata>();
  @$core.pragma('dart2js:noInline')
  static RouteMetadata getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RouteMetadata>(create);
  static RouteMetadata? _defaultInstance;

  /// Compressed length in bytes for each route. Their identifiers
  /// are indices in this list.
  @$pb.TagNumber(1)
  $core.List<$core.int> get routeLengths => $_getList(0);

  /// Those two determine whether we skip "wheelchair" and "bikes" field from trips.
  @$pb.TagNumber(2)
  $core.bool get hasWheelchairInfo => $_getBF(1);
  @$pb.TagNumber(2)
  set hasWheelchairInfo($core.bool v) { $_setBool(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasHasWheelchairInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearHasWheelchairInfo() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get hasBikeInfo => $_getBF(2);
  @$pb.TagNumber(3)
  set hasBikeInfo($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHasBikeInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearHasBikeInfo() => clearField(3);
}

/// These follow the RouteMetadata, not attached to any message.
class Route extends $pb.GeneratedMessage {
  factory Route({
    $core.int? agencyId,
    $core.String? gtfsId,
    RouteType? type,
    $core.String? shortName,
    $core.String? longName,
    $core.String? desc,
    $core.int? color,
    $core.int? textColor,
    $core.bool? hasFrequencies,
    $core.Iterable<Itinerary>? itineraries,
    $core.Iterable<$core.String>? headsigns,
  }) {
    final $result = create();
    if (agencyId != null) {
      $result.agencyId = agencyId;
    }
    if (gtfsId != null) {
      $result.gtfsId = gtfsId;
    }
    if (type != null) {
      $result.type = type;
    }
    if (shortName != null) {
      $result.shortName = shortName;
    }
    if (longName != null) {
      $result.longName = longName;
    }
    if (desc != null) {
      $result.desc = desc;
    }
    if (color != null) {
      $result.color = color;
    }
    if (textColor != null) {
      $result.textColor = textColor;
    }
    if (hasFrequencies != null) {
      $result.hasFrequencies = hasFrequencies;
    }
    if (itineraries != null) {
      $result.itineraries.addAll(itineraries);
    }
    if (headsigns != null) {
      $result.headsigns.addAll(headsigns);
    }
    return $result;
  }
  Route._() : super();
  factory Route.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Route.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Route', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'agencyId', $pb.PbFieldType.OU3)
    ..aOS(2, _omitFieldNames ? '' : 'gtfsId')
    ..e<RouteType>(3, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: RouteType.T_BUS, valueOf: RouteType.valueOf, enumValues: RouteType.values)
    ..aOS(4, _omitFieldNames ? '' : 'shortName')
    ..aOS(5, _omitFieldNames ? '' : 'longName')
    ..aOS(6, _omitFieldNames ? '' : 'desc')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'color', $pb.PbFieldType.OU3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'textColor', $pb.PbFieldType.OU3)
    ..aOB(9, _omitFieldNames ? '' : 'hasFrequencies')
    ..pc<Itinerary>(10, _omitFieldNames ? '' : 'itineraries', $pb.PbFieldType.PM, subBuilder: Itinerary.create)
    ..pPS(11, _omitFieldNames ? '' : 'headsigns')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Route clone() => Route()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Route copyWith(void Function(Route) updates) => super.copyWith((message) => updates(message as Route)) as Route;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Route create() => Route._();
  Route createEmptyInstance() => create();
  static $pb.PbList<Route> createRepeated() => $pb.PbList<Route>();
  @$core.pragma('dart2js:noInline')
  static Route getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Route>(create);
  static Route? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get agencyId => $_getIZ(0);
  @$pb.TagNumber(1)
  set agencyId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAgencyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearAgencyId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get gtfsId => $_getSZ(1);
  @$pb.TagNumber(2)
  set gtfsId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGtfsId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGtfsId() => clearField(2);

  @$pb.TagNumber(3)
  RouteType get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(RouteType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get shortName => $_getSZ(3);
  @$pb.TagNumber(4)
  set shortName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasShortName() => $_has(3);
  @$pb.TagNumber(4)
  void clearShortName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get longName => $_getSZ(4);
  @$pb.TagNumber(5)
  set longName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLongName() => $_has(4);
  @$pb.TagNumber(5)
  void clearLongName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get desc => $_getSZ(5);
  @$pb.TagNumber(6)
  set desc($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasDesc() => $_has(5);
  @$pb.TagNumber(6)
  void clearDesc() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get color => $_getIZ(6);
  @$pb.TagNumber(7)
  set color($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasColor() => $_has(6);
  @$pb.TagNumber(7)
  void clearColor() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get textColor => $_getIZ(7);
  @$pb.TagNumber(8)
  set textColor($core.int v) { $_setUnsignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTextColor() => $_has(7);
  @$pb.TagNumber(8)
  void clearTextColor() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get hasFrequencies => $_getBF(8);
  @$pb.TagNumber(9)
  set hasFrequencies($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasHasFrequencies() => $_has(8);
  @$pb.TagNumber(9)
  void clearHasFrequencies() => clearField(9);

  /// No sorting order.
  @$pb.TagNumber(10)
  $core.List<Itinerary> get itineraries => $_getList(9);

  /// Headsign dictionary, referenced from itineraries (may contain an empty one).
  @$pb.TagNumber(11)
  $core.List<$core.String> get headsigns => $_getList(10);
}

class Itinerary extends $pb.GeneratedMessage {
  factory Itinerary({
    $core.int? shapeId,
    $core.Iterable<$core.int>? stopIds,
    $core.List<$core.int>? headsigns,
    $core.List<$core.int>? pickupTypes,
    $core.List<$core.int>? dropoffTypes,
    $core.bool? oppositeDirection,
    $core.Iterable<$core.int>? departureDeltas,
    $core.Iterable<$core.int>? serviceIds,
    $core.List<$core.int>? trips,
  }) {
    final $result = create();
    if (shapeId != null) {
      $result.shapeId = shapeId;
    }
    if (stopIds != null) {
      $result.stopIds.addAll(stopIds);
    }
    if (headsigns != null) {
      $result.headsigns = headsigns;
    }
    if (pickupTypes != null) {
      $result.pickupTypes = pickupTypes;
    }
    if (dropoffTypes != null) {
      $result.dropoffTypes = dropoffTypes;
    }
    if (oppositeDirection != null) {
      $result.oppositeDirection = oppositeDirection;
    }
    if (departureDeltas != null) {
      $result.departureDeltas.addAll(departureDeltas);
    }
    if (serviceIds != null) {
      $result.serviceIds.addAll(serviceIds);
    }
    if (trips != null) {
      $result.trips = trips;
    }
    return $result;
  }
  Itinerary._() : super();
  factory Itinerary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Itinerary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Itinerary', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'shapeId', $pb.PbFieldType.OU3)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'stopIds', $pb.PbFieldType.KU3)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'headsigns', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'pickupTypes', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'dropoffTypes', $pb.PbFieldType.OY)
    ..aOB(6, _omitFieldNames ? '' : 'oppositeDirection')
    ..p<$core.int>(7, _omitFieldNames ? '' : 'departureDeltas', $pb.PbFieldType.KU3)
    ..p<$core.int>(8, _omitFieldNames ? '' : 'serviceIds', $pb.PbFieldType.KU3)
    ..a<$core.List<$core.int>>(9, _omitFieldNames ? '' : 'trips', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Itinerary clone() => Itinerary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Itinerary copyWith(void Function(Itinerary) updates) => super.copyWith((message) => updates(message as Itinerary)) as Itinerary;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Itinerary create() => Itinerary._();
  Itinerary createEmptyInstance() => create();
  static $pb.PbList<Itinerary> createRepeated() => $pb.PbList<Itinerary>();
  @$core.pragma('dart2js:noInline')
  static Itinerary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Itinerary>(create);
  static Itinerary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get shapeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set shapeId($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasShapeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearShapeId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get stopIds => $_getList(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get headsigns => $_getN(2);
  @$pb.TagNumber(3)
  set headsigns($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasHeadsigns() => $_has(2);
  @$pb.TagNumber(3)
  void clearHeadsigns() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get pickupTypes => $_getN(3);
  @$pb.TagNumber(4)
  set pickupTypes($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPickupTypes() => $_has(3);
  @$pb.TagNumber(4)
  void clearPickupTypes() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get dropoffTypes => $_getN(4);
  @$pb.TagNumber(5)
  set dropoffTypes($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasDropoffTypes() => $_has(4);
  @$pb.TagNumber(5)
  void clearDropoffTypes() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get oppositeDirection => $_getBF(5);
  @$pb.TagNumber(6)
  set oppositeDirection($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOppositeDirection() => $_has(5);
  @$pb.TagNumber(6)
  void clearOppositeDirection() => clearField(6);

  /// The most common deltas between stop departures for trips.
  /// Granularity is 5 seconds, rounded down.
  @$pb.TagNumber(7)
  $core.List<$core.int> get departureDeltas => $_getList(6);

  @$pb.TagNumber(8)
  $core.List<$core.int> get serviceIds => $_getList(7);

  @$pb.TagNumber(9)
  $core.List<$core.int> get trips => $_getN(8);
  @$pb.TagNumber(9)
  set trips($core.List<$core.int> v) { $_setBytes(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTrips() => $_has(8);
  @$pb.TagNumber(9)
  void clearTrips() => clearField(9);
}

/// Column-oriented set of trips following the Route message.
/// As for StopsChunk, does not appear as is, but lists fields
/// and their types for unpacking.
/// Trips are ordered by the first departure.
class TripsChunk extends $pb.GeneratedMessage {
  factory TripsChunk({
    $core.int? firstStopDeparture,
    $core.Iterable<$core.int>? departureDeltas,
    $core.String? gtfsId,
    $core.bool? approximate,
    $core.int? endTime,
    $core.int? interval,
    Accessibility? wheelchair,
    Accessibility? bikes,
  }) {
    final $result = create();
    if (firstStopDeparture != null) {
      $result.firstStopDeparture = firstStopDeparture;
    }
    if (departureDeltas != null) {
      $result.departureDeltas.addAll(departureDeltas);
    }
    if (gtfsId != null) {
      $result.gtfsId = gtfsId;
    }
    if (approximate != null) {
      $result.approximate = approximate;
    }
    if (endTime != null) {
      $result.endTime = endTime;
    }
    if (interval != null) {
      $result.interval = interval;
    }
    if (wheelchair != null) {
      $result.wheelchair = wheelchair;
    }
    if (bikes != null) {
      $result.bikes = bikes;
    }
    return $result;
  }
  TripsChunk._() : super();
  factory TripsChunk.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TripsChunk.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TripsChunk', package: const $pb.PackageName(_omitMessageNames ? '' : 'gtfs'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'firstStopDeparture', $pb.PbFieldType.OU3)
    ..p<$core.int>(2, _omitFieldNames ? '' : 'departureDeltas', $pb.PbFieldType.KS3)
    ..aOS(3, _omitFieldNames ? '' : 'gtfsId')
    ..aOB(4, _omitFieldNames ? '' : 'approximate')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'endTime', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'interval', $pb.PbFieldType.OU3)
    ..e<Accessibility>(7, _omitFieldNames ? '' : 'wheelchair', $pb.PbFieldType.OE, defaultOrMaker: Accessibility.A_UNKNOWN, valueOf: Accessibility.valueOf, enumValues: Accessibility.values)
    ..e<Accessibility>(8, _omitFieldNames ? '' : 'bikes', $pb.PbFieldType.OE, defaultOrMaker: Accessibility.A_UNKNOWN, valueOf: Accessibility.valueOf, enumValues: Accessibility.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TripsChunk clone() => TripsChunk()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TripsChunk copyWith(void Function(TripsChunk) updates) => super.copyWith((message) => updates(message as TripsChunk)) as TripsChunk;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TripsChunk create() => TripsChunk._();
  TripsChunk createEmptyInstance() => create();
  static $pb.PbList<TripsChunk> createRepeated() => $pb.PbList<TripsChunk>();
  @$core.pragma('dart2js:noInline')
  static TripsChunk getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TripsChunk>(create);
  static TripsChunk? _defaultInstance;

  /// (hours * 720) + (minutes * 12) + (seconds / 5), rounded down. Delta-coded.
  /// First because we want to filter trips by first stop-last stop times.
  @$pb.TagNumber(1)
  $core.int get firstStopDeparture => $_getIZ(0);
  @$pb.TagNumber(1)
  set firstStopDeparture($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstStopDeparture() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstStopDeparture() => clearField(1);

  /// Differences from itinerary.depature_deltas, RLE-packed. Granularity is 5 seconds.
  /// Transposed: first all trips for stop 1, then for stop 2 etc etc.
  /// Count is (number of trips) × (number of stops - 1)
  /// There are no missing values: we pre-calculate missing departure times.
  /// Mind the accumulated rounding error!
  @$pb.TagNumber(2)
  $core.List<$core.int> get departureDeltas => $_getList(1);

  /// Not a simple length + string: first byte is length when < 0x80.
  /// When 7 bit is set, it has a common prefix length with the previous,
  /// and the suffix length is in the next byte. The first can be of 255 length.
  @$pb.TagNumber(3)
  $core.String get gtfsId => $_getSZ(2);
  @$pb.TagNumber(3)
  set gtfsId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGtfsId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGtfsId() => clearField(3);

  /// schedule-based: whether we can trust every timestamp for departures/arrivals.
  /// frequency-based: whether the intervals are exact. Bit-packed.
  @$pb.TagNumber(4)
  $core.bool get approximate => $_getBF(3);
  @$pb.TagNumber(4)
  set approximate($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasApproximate() => $_has(3);
  @$pb.TagNumber(4)
  void clearApproximate() => clearField(4);

  /// When Route.has_frequencies is true, those two are present.
  /// Start time is in first_stop_departure. Granularity is 5 seconds.
  /// Rounding down for start and up for end.
  @$pb.TagNumber(5)
  $core.int get endTime => $_getIZ(4);
  @$pb.TagNumber(5)
  set endTime($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasEndTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndTime() => clearField(5);

  /// Here, granularity is 1 second, like in GTFS. No point in saving a byte.
  @$pb.TagNumber(6)
  $core.int get interval => $_getIZ(5);
  @$pb.TagNumber(6)
  set interval($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasInterval() => $_has(5);
  @$pb.TagNumber(6)
  void clearInterval() => clearField(6);

  /// Present only when RouteMetadata.has_wheelchair/bikes are true
  @$pb.TagNumber(7)
  Accessibility get wheelchair => $_getN(6);
  @$pb.TagNumber(7)
  set wheelchair(Accessibility v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasWheelchair() => $_has(6);
  @$pb.TagNumber(7)
  void clearWheelchair() => clearField(7);

  @$pb.TagNumber(8)
  Accessibility get bikes => $_getN(7);
  @$pb.TagNumber(8)
  set bikes(Accessibility v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasBikes() => $_has(7);
  @$pb.TagNumber(8)
  void clearBikes() => clearField(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
