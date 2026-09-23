package com.example.discount_card_app

import android.util.Log
import androidx.annotation.OptIn
import androidx.camera.core.ExperimentalGetImage
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import com.google.mlkit.vision.barcode.BarcodeScanner
import com.google.mlkit.vision.common.InputImage
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.CancellationException
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.launch
import kotlinx.coroutines.tasks.await


data class ScannedBarcode(val rawValue: String, val format: Int)

class BarcodeAnalyzer(
    private val scanner: BarcodeScanner
) : ImageAnalysis.Analyzer {

    private val scope = CoroutineScope(Dispatchers.Default + SupervisorJob())
    private val _barcodeEvents = MutableSharedFlow<ScannedBarcode>(extraBufferCapacity = 1)
    val barcodeEvents: SharedFlow<ScannedBarcode> = _barcodeEvents.asSharedFlow()

    @OptIn(ExperimentalGetImage::class)
    override fun analyze(imageProxy: ImageProxy) {
        val mediaImage = imageProxy.image
        if (mediaImage == null) {
            imageProxy.close()
            return
        }
        val inputImage = InputImage.fromMediaImage(
            mediaImage,
            imageProxy.imageInfo.rotationDegrees
        )
        scope.launch {
            try {
                val barcodes = scanner.process(inputImage).await()
                for (barcode in barcodes) {
                    val rawValue = barcode.rawValue
                    if (!rawValue.isNullOrBlank()) {
                        _barcodeEvents.emit(ScannedBarcode(rawValue, barcode.format))
                        break
                    }
                }
            } catch (e: CancellationException) {
                throw e
            } catch (e: Exception) {
                Log.e(TAG, "Barcode detection failed on frame", e)
            }
        }.invokeOnCompletion { imageProxy.close() }
    }

    fun close() {
        scope.cancel()
        scanner.close()
    }

    companion object {
        private const val TAG = "BarcodeAnalyzer"
    }
}