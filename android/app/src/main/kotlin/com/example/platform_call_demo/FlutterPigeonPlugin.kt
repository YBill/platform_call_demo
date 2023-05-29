package com.example.platform_call_demo

import android.content.Context
import android.widget.Toast
import com.example.platform_call_demo.pigeons.FlutterCallNativeApi
import com.example.platform_call_demo.pigeons.NativeCallFlutterApi
import com.example.platform_call_demo.pigeons.SearchReply
import com.example.platform_call_demo.pigeons.SearchRequest
import io.flutter.embedding.engine.plugins.FlutterPlugin

/** FlutterPigeonPlugin */
class FlutterPigeonPlugin: FlutterPlugin, FlutterCallNativeApi {

    var nativeApi : NativeCallFlutterApi? = null
    var context: Context? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext

        // setup
        FlutterCallNativeApi.setUp(flutterPluginBinding.binaryMessenger, this)

        nativeApi = NativeCallFlutterApi(flutterPluginBinding.binaryMessenger)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        FlutterCallNativeApi.setUp(binding.binaryMessenger, null)
    }

    // flutter call native
    override fun search(request: SearchRequest): SearchReply {
        val reply = SearchReply(request.query + " - Android Result")

        // ------ native call flutter
        nativeCallFlutter()
        // -------

        // native reply flutter
        return reply
    }

    private fun nativeCallFlutter() {
        val request = SearchRequest("Android call Flutter")
        nativeApi?.query(request) {
            Toast.makeText(context, "Call Flutter", Toast.LENGTH_SHORT).show()
        }
    }

}