import 'package:pigeon/pigeon.dart';

/// 控制台执行：flutter pub run pigeon --input pigeons/message.dart

// 输出配置
@ConfigurePigeon(PigeonOptions(
  dartOut: './lib/message.dart',
  kotlinOut: 'android/app/src/main/kotlin/com/example/platform_call_demo/pigeons/Pigeon.kt',
  kotlinOptions: KotlinOptions(
    package: 'com.example.platform_call_demo',
  ),
))

class SearchRequest {
  String? query;
}

class SearchReply {
  String? result;
}

/// flutter call native
@HostApi()
abstract class FlutterCallNativeApi {
  SearchReply search(SearchRequest request);
}

/// native call flutter
@FlutterApi()
abstract class NativeCallFlutterApi{
  SearchReply query(SearchRequest request);
}
