package com.example.platform_call_demo

import com.example.platform_call_demo.pigeons.BookApi
import io.flutter.embedding.engine.plugins.FlutterPlugin

/**
 * author ywb
 * date 2023/5/29
 * desc
 */
class MyFlutterPlugins : FlutterPlugin {

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        BookApi.setUp(binding.binaryMessenger, MyApi())
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {

    }
}