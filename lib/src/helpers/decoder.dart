import 'dart:math' show min;
import 'dart:typed_data';
import 'dart:convert' show utf8;

class BinaryFormatException extends FormatException {
  BinaryFormatException(super.message);
}

class OutOfDataException implements Exception {
  final int expected;
  final int found;

  OutOfDataException(this.found, this.expected);

  @override
  String toString() => 'Expected $expected, ran out at $found';
}

class BinaryDecoder {
  final Uint8List _buffer;
  int _bufferPos = 0;

  BinaryDecoder(this._buffer);

  int _toSigned(int uint) => uint & 1 == 1 ? -(uint >> 1) - 1 : uint >> 1;

  int readUint() {
    int pos = _bufferPos;
    final maxPos = min(_buffer.lengthInBytes, pos + 10);
    int result = 0;
    int mult = 0;
    while (pos < maxPos) {
      final byte = _buffer[pos++];
      result |= (byte & 0x7F) << mult;
      mult += 7;
      if (byte & 0x80 == 0) {
        _bufferPos = pos;
        return result;
      }
    }
    throw BinaryFormatException("Malformed uint32");
  }

  int readSint() => _toSigned(readUint());

  bool isAtEnd() => _bufferPos >= _buffer.length;

  Uint8List _view(int offset, int length) => Uint8List.view(_buffer.buffer, _buffer.offsetInBytes + _bufferPos + offset, length);

  String readString() {
    final length = _buffer[_bufferPos];
    if (_bufferPos + length + 1 > _buffer.length) {
      throw BinaryFormatException("String out of bounds");
    }
    final bytes = _view(1, length);
    _bufferPos += length + 1;
    return utf8.decode(bytes);
  }

  List<String> readStrings([int? count]) {
    count ??= readUint();
    final result = <String>[];
    for (int i = 0; i < count; i++) {
      if (isAtEnd()) throw OutOfDataException(i, count);
      result.add(readString());
    }
    return result;
  }

  List<String> readStringsCommon(int count) {
    final firstLen = _buffer[_bufferPos];
    List<int> last = _view(1, firstLen);
    _bufferPos += firstLen + 1;
    final result = <String>[utf8.decode(last)];

    for (int i = 1; i < count; i++) {
      if (isAtEnd()) throw OutOfDataException(i, count);
      final lenFlag = _buffer[_bufferPos];
      if (lenFlag > 0x80) {
        // common prefix
        final suffixLen = _buffer[_bufferPos + 1];
        final suffix = _view(2, suffixLen);
        last = last.sublist(0, (lenFlag & 0x7F) + 1) + suffix;
        _bufferPos += 2 + suffixLen;
      } else if (lenFlag == 0x80) {
        // special case of a long value
        final valueLen = _buffer[_bufferPos + 1];
        last = _view(2, valueLen);
        _bufferPos += 2 + valueLen;
      } else {
        // full string
        last = _view(1, lenFlag);
        _bufferPos += 1 + lenFlag;
      }
      result.add(utf8.decode(last));
    }
    return result;
  }

  List<bool> read1Bit(int count) {
    final result = List.generate(count, (_) => false);
    final byteCount = (count / 8).ceil();
    for (int byte = 0; byte < byteCount; byte++) {
      final cnt = min(8, count - (byte << 3));
      for (int i = 0; i < cnt; i++) {
        result[byte * 8 + i] = _buffer[_bufferPos + byte] & (128 >> i) != 0;
      }
    }
    _bufferPos += byteCount;
    return result;
  }

  List<int> read2Bit(int count) {
    final result = List.generate(count, (_) => 0);
    final byteCount = (count / 4).ceil();
    for (int byte = 0; byte < byteCount; byte++) {
      final cnt = min(4, count - (byte << 2));
      for (int i = 0; i < cnt; i++) {
        result[byte * 4 + i] = (_buffer[_bufferPos + byte] >> (6 - i * 2)) & 3;
      }
    }
    _bufferPos += byteCount;
    return result;
  }

  List<int> readUints([int? count]) {
    count ??= readUint();
    final result = <int>[];
    for (int i = 0; i < count; i++) {
      if (isAtEnd()) throw OutOfDataException(i, count);
      result.add(readUint());
    }
    return result;
  }

  List<int> readSints([int? count]) {
    count ??= readUint();
    final result = <int>[];
    for (int i = 0; i < count; i++) {
      if (isAtEnd()) throw OutOfDataException(i, count);
      result.add(readSint());
    }
    return result;
  }

  List<int> readUintsDelta([int? count, int start = 0]) {
    final result = readUints(count);
    for (int i = 0; i < result.length; i++) {
      result[i] += i == 0 ? start : result[i-1];
    }
    return result;
  }

  List<int> readSintsDelta([int? count, int start = 0]) {
    final result = readSints(count);
    for (int i = 0; i < result.length; i++) {
      result[i] += i == 0 ? start : result[i-1];
    }
    return result;
  }

  List<E> _unpackRle<E>(int? count, E Function() unpack) {
    count ??= readUint();
    final result = <E>[];
    while (!isAtEnd() && result.length < count) {
      final runLen = _buffer[_bufferPos];
      _bufferPos++;
      if (runLen >= 0x80) {
        for (int i = 0; i < 256 - runLen; i++) {
          result.add(unpack());
        }
      } else {
        final value = unpack();
        result.addAll(Iterable.generate(runLen + 2, (_) => value));
      }
    }
    return result;
  }

  List<int> readUintsRle([int? count]) => _unpackRle(count, readUint);

  List<int> readSintsRle([int? count]) => _unpackRle(count, readSint);

  List<String> readStringsRle([int? count]) => _unpackRle(count, readString);
}