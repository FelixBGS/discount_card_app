package com.example.discount_card_app

import com.example.discount_card_app.scanner.platform.BarcodeScannerPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(BarcodeScannerPlugin())
    }
}
