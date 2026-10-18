import 'dart:io';
import 'dart:typed_data';
import 'package:gtfs_binary_dart/src/proto/gtfs_binary.pb.dart';
import 'package:libcompress/libcompress.dart';

abstract class BinaryReader {
  bool compressed;
  final _zstd = ZstdCodec();

  BinaryReader({required this.compressed});

  BinaryReader setCompressed(bool compressed) {
    this.compressed = compressed;
    return this;
  }

  void seek(int offset) {
    if (offset < 0) {
      seekImpl(fileLengthImpl() + offset);
    } else {
      seekImpl(offset);
    }
  }

  Uint8List read(int offset, int length, {bool? compressed}) {
    seek(offset);
    final data = readImpl(length.abs());
    if (length > 0 && (compressed ?? this.compressed)) {
      return _zstd.decompress(data);
    }
    return data;
  }

  Uint8List readBlock(BlockMetadata block) => read(block.offset.toInt(), block.length, compressed: block.compressed);

  int fileLengthImpl();
  void seekImpl(int offset);
  Uint8List readImpl(int length);
  void close() {}
}

class BinaryDataReader extends BinaryReader {
  final ByteBuffer _buffer;
  int _pos = 0;

  BinaryDataReader(this._buffer, {super.compressed = false});

  @override
  void seekImpl(int offset) {
    _pos = offset;
  }

  @override
  int fileLengthImpl() => _buffer.lengthInBytes;

  @override
  Uint8List readImpl(int length) => Uint8List.view(_buffer, _pos, length);
}

class BinaryFileReader extends BinaryReader {
  final RandomAccessFile _file;

  BinaryFileReader(this._file, {super.compressed = false});

  @override
  void seekImpl(int offset) => _file.setPositionSync(offset);

  @override
  int fileLengthImpl() => _file.lengthSync();

  @override
  Uint8List readImpl(int length) => _file.readSync(length);

  @override
  void close() => _file.closeSync();
}
