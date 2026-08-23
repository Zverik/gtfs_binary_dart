import 'dart:io';
import 'dart:typed_data';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';
import 'package:libcompress/libcompress.dart';

class BinaryReader {
  final RandomAccessFile _file;
  final _zstd = ZstdCodec();
  final bool compressed;

  BinaryReader(this._file, {this.compressed = false});

  void seekSync(int offset) {
    if (offset < 0) {
      _file.setPositionSync(_file.lengthSync() + offset);
    } else {
      _file.setPositionSync(offset);
    }
  }

  Future<void> seek(int offset) async {
    if (offset < 0) {
      await _file.setPosition(await _file.length() + offset);
    } else {
      await _file.setPosition(offset);
    }
  }

  Uint8List readSync(int offset, int length, {bool? compressed}) {
    seekSync(offset);
    final data = _file.readSync(length.abs());
    if (length > 0 && (compressed ?? this.compressed)) {
      return _zstd.decompress(data);
    }
    return data;
  }

  Future<Uint8List> read(int offset, int length, {bool? compressed}) async {
    await seek(offset);
    final data = await _file.read(length.abs());
    if (length > 0 && (compressed ?? this.compressed)) {
      // note: not async!
      return _zstd.decompress(data);
    }
    return data;
  }

  Uint8List readBlockSync(BlockMetadata block) =>
      readSync(block.offset.toInt(), block.length, compressed: block.compressed);

  Future<Uint8List> readBlock(BlockMetadata block) =>
      read(block.offset.toInt(), block.length, compressed: block.compressed);
}
