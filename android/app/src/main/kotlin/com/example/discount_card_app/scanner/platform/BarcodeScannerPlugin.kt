package com.example.discount_card_app.scanner.platform

import androidx.lifecycle.LifecycleOwner
import com.example.discount_card_app.scanner.ScannerConstants
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

class BarcodeScannerPlugin : FlutterPlugin, ActivityAware {
    private var lifecycleOwner: LifecycleOwner? = null

    override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        binding.platformViewRegistry.registerViewFactory(
            ScannerConstants.VIEW_TYPE,
            BarcodeScannerViewFactory(binding.binaryMessenger) { lifecycleOwner },
        )
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) = Unit

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        lifecycleOwner = binding.activity as? LifecycleOwner
    }

    override fun onDetachedFromActivityForConfigChanges() {
        lifecycleOwner = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        lifecycleOwner = null
    }
}
