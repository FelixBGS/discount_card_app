package com.example.discount_card_app

import android.content.Context
import android.view.View
import androidx.lifecycle.LifecycleOwner
import com.example.discount_card_app.extension.throttleFirstBy
import com.google.mlkit.vision.barcode.BarcodeScanning
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.asExecutor
import kotlinx.coroutines.cancel
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.onEach

class BarcodeScannerPlatformView(
    context: Context,
    messenger: BinaryMessenger,
    id: Int,
    creationParams: Map<*, *>?,
    lifecycleOwner: LifecycleOwner
) : PlatformView, MethodChannel.MethodCallHandler {
    private val channel = MethodChannel(messenger, "${VIEW_TYPE}_$id")
    private val scope = CoroutineScope(Dispatchers.Main.immediate + SupervisorJob())
    private val analyzer: BarcodeAnalyzer
    private val cameraManager: CameraManager

    init {
        channel.setMethodCallHandler(this)

        val options = BarcodeFormatParser.parse(creationParams?.get("formats"))
        val scanner = BarcodeScanning.getClient(options)

        analyzer = BarcodeAnalyzer(scanner)

        cameraManager = CameraManager(
            context = context,
            lifecycleOwner = lifecycleOwner,
            analysisExecutor = Dispatchers.Default.asExecutor()
        )
        cameraManager.startCamera(analyzer)

        observeBarcodes()
    }
    private fun observeBarcodes() {
        analyzer.barcodeEvents
            .throttleFirstBy(THROTTLE_MS) { it.rawValue }
            .onEach { barcode ->
                channel.invokeMethod(
                    "onBarcodeScanned",
                    mapOf(
                        "value" to barcode.rawValue,
                        "format" to BarcodeFormatParser.mapToString(barcode.format)
                    )
                )
            }
            .launchIn(scope)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "toggleTorch" -> {
                val enable = call.argument<Boolean>("enable") ?: false
                cameraManager.toggleTorch(enable)
                result.success(null)
            }
            else -> result.notImplemented()
        }
    }

    override fun getView(): View = cameraManager.previewView

    override fun dispose() {
        channel.setMethodCallHandler(null)
        scope.cancel()
        analyzer.close()
        cameraManager.unbind()
    }
    companion object {
        const val VIEW_TYPE = "barcode_scanner"
        private const val THROTTLE_MS = 1500L
    }
}