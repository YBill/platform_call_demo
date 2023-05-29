import 'package:pigeon/pigeon.dart';

/// 控制台执行：flutter pub run pigeon --input pigeons/page.dart

// 输出配置
@ConfigurePigeon(PigeonOptions(
  dartOut: './lib/page.dart',
  kotlinOut: 'android/app/src/main/kotlin/com/example/platform_call_demo/pigeons/Page.kt',
  kotlinOptions: KotlinOptions(
    package: 'com.example.platform_call_demo',
  ),
))

/// flutter call native
@HostApi()
abstract class FlutterCallNativePage {
  bool startPage(String title);
}
