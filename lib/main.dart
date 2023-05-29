import 'dart:async';
import 'package:flutter/material.dart';
import 'message.dart';
import 'page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  String nativeReplay = 'Unknown'; // Flutter调用Native后Native返回值
  String nativeParams = 'Unknown'; // Native调用Flutter后传过来的参数

  @override
  State<MyApp> createState() => _MyAppState();
}

class NativeCallFlutterApiImpl extends NativeCallFlutterApi {
  Function(String value) callback;
  NativeCallFlutterApiImpl(this.callback);

  @override
  SearchReply query(SearchRequest request) {
    SearchReply reply = SearchReply(result: "${request.query}");
    callback(reply.result ?? "null");
    return reply;
  }
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    NativeCallFlutterApi.setup(NativeCallFlutterApiImpl((String value){
      setState(() {
        widget.nativeParams = value;
      });
    }));
  }

  Future<void> getNativeResult() async {
    FlutterCallNativeApi api = FlutterCallNativeApi();
    SearchRequest request = SearchRequest(query: "Flutter");
    SearchReply reply = await api.search(request);
    setState(() {
      widget.nativeReplay = reply.result ?? "null";
    });
  }

  Future<void> startNativePage() async {
    FlutterCallNativePage api = FlutterCallNativePage();
    bool reply = await api.startPage("Flutter Params");
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Text('Flutter call Native: ${widget.nativeReplay}\n'),
              Text('Native call Flutter: ${widget.nativeParams}\n'),
              MaterialButton(
                  height: 40,
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 5,
                  splashColor: Colors.teal,
                  padding: const EdgeInsets.all(8),
                  child: const Text("调用 Native"),
                  onPressed: () => {getNativeResult()}),
              MaterialButton(
                  height: 40,
                  color: Colors.blue,
                  textColor: Colors.white,
                  elevation: 5,
                  splashColor: Colors.teal,
                  padding: const EdgeInsets.all(8),
                  child: const Text("跳转原生 Activity"),
                  onPressed: () => {startNativePage()})
            ],
          ),
        ),
      ),
    );
  }
}
