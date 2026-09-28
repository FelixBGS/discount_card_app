package com.example.discount_card_app.scanner.platform

import android.content.Context
import android.view.View
import androidx.lifecycle.LifecycleOwner
import com.example.discount_card_app.scanner.ScannerConstants
import com.example.discount_card_app.scanner.analysis.BarcodeAnalyzer
import com.example.discount_card_app.scanner.analysis.BarcodeFormatParser
import com.example.discount_card_app.scanner.camera.CameraError
import com.example.discount_card_app.scanner.camera.CameraManager
import com.google.mlkit.vision.barcode.BarcodeScanning
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

class BarcodeScannerPlatformView(
    context: Context,
    messenger: BinaryMessenger,
    viewId: Int,
    creationParams: Map<*, *>?,
    lifecycleOwner: LifecycleOwner,
) : PlatformView, MethodChannel.MethodCallHandler {

    private val methodChannel = MethodChannel(
        messenger,
        "${ScannerConstants.METHODS_CHANNEL_PREFIX}/$viewId",
    )

    private val eventChannel = EventChannel(
        messenger,
        "${ScannerConstants.EVENTS_CHANNEL_PREFIX}/$viewId",
    )

    private val scope = CoroutineScope(
        Dispatchers.Main.immediate + SupervisorJob(),
    )

    private val analyzer = BarcodeAnalyzer(
        BarcodeScanning.getClient(
            BarcodeFormatParser.parse(creationParams?.get(ScannerConstants.PARAM_FORMATS)),
        ),
    )

    private val cameraManager = CameraManager(
        context = context,
        lifecycleOwner = lifecycleOwner,
    )

    private val eventStreamHandler = BarcodeEventStreamHandler(
        barcodeEvents = analyzer.barcodeEvents,
        scope = scope,
    )

    init {
        methodChannel.setMethodCallHandler(this)
        eventChannel.setStreamHandler(eventStreamHandler)
    }

    override fun getView(): View = cameraManager.previewView

    override fun onMethodCall(
        call: MethodCall,
        result: MethodChannel.Result,
    ) {
        when (call.method) {
            ScannerConstants.METHOD_START -> result.replyWith { cameraManager.start(analyzer) }
            ScannerConstants.METHOD_STOP -> result.replyWith { Result.success(cameraManager.stop()) }
            ScannerConstants.METHOD_SET_TORCH -> handleSetTorch(call, result)
            else -> result.notImplemented()
        }
    }

    private fun handleSetTorch(
        call: MethodCall,
        result: MethodChannel.Result,
    ) {
        val enabled = call.argument<Boolean>(ScannerConstants.ARG_TORCH_ENABLED)

        if (enabled == null) {
            result.error(
                "invalid_arguments",
                "Argument 'enabled' must be a Boolean",
                null,
            )
            return
        }

        result.replyWith { cameraManager.setTorch(enabled) }
    }

    private fun MethodChannel.Result.replyWith(action: suspend () -> Result<Unit>) {
        scope.launch {
            try {
                action().fold(
                    onSuccess = { success(null) },
                    onFailure = { failure ->
                        val code = (failure as? CameraError)?.code ?: "unknown_error"
                        error(code, failure.message, null)
                    },
                )
            } catch (cancellation: CancellationException) {
                error("cancelled", "Scanner view was disposed", null)
                throw cancellation
            }
        }
    }

    override fun dispose() {
        methodChannel.setMethodCallHandler(null)
        eventStreamHandler.close()
        eventChannel.setStreamHandler(null)

        scope.launch {
            cameraManager.dispose()
            analyzer.close()
        }.invokeOnCompletion { scope.cancel() }
    }
}
