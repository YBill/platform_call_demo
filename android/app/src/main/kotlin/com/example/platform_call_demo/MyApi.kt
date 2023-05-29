package com.example.platform_call_demo

import android.util.Log
import com.example.platform_call_demo.pigeons.Book
import com.example.platform_call_demo.pigeons.BookApi
import java.util.Collections

/**
 * author ywb
 * date 2023/5/29
 * desc
 */
class MyApi  : BookApi {

    override fun search(keyword: String): List<Book?> {
        Log.d("Bill", "flutter call android params -> $keyword")
        val result = Book()
        result.author = keyword
        result.title = String.format("%s's Life", keyword)
        return Collections.singletonList(result)
    }

}