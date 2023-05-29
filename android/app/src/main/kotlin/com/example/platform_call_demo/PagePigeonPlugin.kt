package com.example.platform_call_demo

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import com.example.platform_call_demo.pigeons.FlutterCallNativeApi
import com.example.platform_call_demo.pigeons.FlutterCallNativePage
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** FlutterPigeonPlugin */
class PagePigeonPlugin : FlutterPlugin, FlutterCallNativePage, ActivityAware {

    var mActivity: Activity? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        // setup
        FlutterCallNativePage.setUp(flutterPluginBinding.binaryMessenger, this)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        FlutterCallNativeApi.setUp(binding.binaryMessenger, null)
    }

    override fun startPage(title: String): Boolean {
        val intent = Intent(mActivity, AndroidNativeDetailActivity::class.java)
        val extras = Bundle()
        extras.putString("title", title)
        intent.putExtras(extras)
        if (mActivity != null) {
            mActivity?.startActivity(intent)
            return true
        }
        return false
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        mActivity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {

    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {

    }

    override fun onDetachedFromActivity() {

    }

}