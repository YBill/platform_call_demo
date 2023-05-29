// Autogenerated from Pigeon (v10.0.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

/// 控制台执行：flutter pub run pigeon --input pigeons/message.dart
class SearchRequest {
  SearchRequest({
    this.query,
  });

  String? query;

  Object encode() {
    return <Object?>[
      query,
    ];
  }

  static SearchRequest decode(Object result) {
    result as List<Object?>;
    return SearchRequest(
      query: result[0] as String?,
    );
  }
}

class SearchReply {
  SearchReply({
    this.result,
  });

  String? result;

  Object encode() {
    return <Object?>[
      result,
    ];
  }

  static SearchReply decode(Object result) {
    result as List<Object?>;
    return SearchReply(
      result: result[0] as String?,
    );
  }
}

class _FlutterCallNativeApiCodec extends StandardMessageCodec {
  const _FlutterCallNativeApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SearchReply) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is SearchRequest) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return SearchReply.decode(readValue(buffer)!);
      case 129: 
        return SearchRequest.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// flutter call native
class FlutterCallNativeApi {
  /// Constructor for [FlutterCallNativeApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  FlutterCallNativeApi({BinaryMessenger? binaryMessenger})
      : _binaryMessenger = binaryMessenger;
  final BinaryMessenger? _binaryMessenger;

  static const MessageCodec<Object?> codec = _FlutterCallNativeApiCodec();

  Future<SearchReply> search(SearchRequest arg_request) async {
    final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
        'dev.flutter.pigeon.FlutterCallNativeApi.search', codec,
        binaryMessenger: _binaryMessenger);
    final List<Object?>? replyList =
        await channel.send(<Object?>[arg_request]) as List<Object?>?;
    if (replyList == null) {
      throw PlatformException(
        code: 'channel-error',
        message: 'Unable to establish connection on channel.',
      );
    } else if (replyList.length > 1) {
      throw PlatformException(
        code: replyList[0]! as String,
        message: replyList[1] as String?,
        details: replyList[2],
      );
    } else if (replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (replyList[0] as SearchReply?)!;
    }
  }
}

class _NativeCallFlutterApiCodec extends StandardMessageCodec {
  const _NativeCallFlutterApiCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is SearchReply) {
      buffer.putUint8(128);
      writeValue(buffer, value.encode());
    } else if (value is SearchRequest) {
      buffer.putUint8(129);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 128: 
        return SearchReply.decode(readValue(buffer)!);
      case 129: 
        return SearchRequest.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// native call flutter
abstract class NativeCallFlutterApi {
  static const MessageCodec<Object?> codec = _NativeCallFlutterApiCodec();

  SearchReply query(SearchRequest request);

  static void setup(NativeCallFlutterApi? api, {BinaryMessenger? binaryMessenger}) {
    {
      final BasicMessageChannel<Object?> channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.NativeCallFlutterApi.query', codec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        channel.setMessageHandler(null);
      } else {
        channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.NativeCallFlutterApi.query was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final SearchRequest? arg_request = (args[0] as SearchRequest?);
          assert(arg_request != null,
              'Argument for dev.flutter.pigeon.NativeCallFlutterApi.query was null, expected non-null SearchRequest.');
          final SearchReply output = api.query(arg_request!);
          return output;
        });
      }
    }
  }
}
