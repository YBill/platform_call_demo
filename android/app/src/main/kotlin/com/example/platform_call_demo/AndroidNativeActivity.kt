package com.example.platform_call_demo

import android.content.Intent
import android.os.Bundle
import android.view.View
import androidx.appcompat.app.AppCompatActivity

class AndroidNativeActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_text)
    }

    fun handleFlutter(view: View) {
        val intent = Intent(this, MainActivity::class.java)
        startActivity(intent)
    }

}