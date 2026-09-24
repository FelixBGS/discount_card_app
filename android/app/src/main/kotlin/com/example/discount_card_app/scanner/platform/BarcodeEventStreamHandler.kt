package com.example.discount_card_app.scanner.platform

import com.example.discount_card_app.extension.throttleFirstBy
import com.example.discount_card_app.scanner.analysis.BarcodeFormatParser
import com.example.discount_card_app.scanner.analysis.ScannedBarcode
import io.flutter.plugin.common.EventChannel
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Job
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.launchIn
import kotlinx.coroutines.flow.onEach
import kotlin.time.Duration.Companion.milliseconds

class BarcodeEventStreamHandler(
    private val barcodeEvents: Flow<ScannedBarcode>,
    private val scope: CoroutineScope,
) : EventChannel.StreamHandler {
    private var sink: EventChannel.EventSink? = null
    private var job: Job? = null

    override fun onListen(arguments: Any?, events: EventChannel.EventSink) {
        job?.cancel()
        sink = events
        job = barcodeEvents
            .throttleFirstBy(THROTTLE_WINDOW) { it.rawValue }
            .onEach { barcode ->
                events.success(
                    mapOf(
                        "value" to barcode.rawValue,
                        "format" to BarcodeFormatParser.mapToString(barcode.format),
                    )
                )
            }
            .launchIn(scope)
    }

    override fun onCancel(arguments: Any?) {
        job?.cancel()
        job = null
        sink = null
    }

    fun close() {
        job?.cancel()
        job = null
        sink?.endOfStream()
        sink = null
    }

    private companion object {
        val THROTTLE_WINDOW = 1_500.milliseconds
    }
}
