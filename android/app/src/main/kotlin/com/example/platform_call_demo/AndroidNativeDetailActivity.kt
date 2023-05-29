package com.example.platform_call_demo

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView

class AndroidNativeDetailActivity : AppCompatActivity() {

    private var titleTv: TextView? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_android_native_detail)
        titleTv = findViewById(R.id.tv_detail)

        val text = intent.extras?.let {
            it.getString("title")
        } ?: "No Params"
        titleTv?.text = text

    }
}