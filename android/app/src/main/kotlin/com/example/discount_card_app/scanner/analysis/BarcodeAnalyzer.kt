package com.example.discount_card_app.scanner.analysis

import android.util.Log
import androidx.annotation.OptIn
import androidx.camera.core.ExperimentalGetImage
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.ImageProxy
import com.google.mlkit.vision.barcode.BarcodeScanner
import com.google.mlkit.vision.barcode.common.Barcode
import com.google.mlkit.vision.common.InputImage
import kotlinx.coroutines.channels.BufferOverflow
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.SharedFlow
import kotlinx.coroutines.flow.asSharedFlow

data class ScannedBarcode(val rawValue: String, val format: Int)

class BarcodeAnalyzer(
    private val scanner: BarcodeScanner
) : ImageAnalysis.Analyzer {

    private val _barcodeEvents = MutableSharedFlow<ScannedBarcode>(
        extraBufferCapacity = 1,
        onBufferOverflow = BufferOverflow.DROP_OLDEST,
    )
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
        scanner.process(inputImage)
            .addOnSuccessListener { barcodes ->
                barcodes.firstNotNullOfOrNull(::toScannedBarcode)
                    ?.let(_barcodeEvents::tryEmit)
            }
            .addOnFailureListener { error ->
                Log.e(TAG, "Barcode detection failed on frame", error)
            }
            .addOnCompleteListener { imageProxy.close() }
    }

    fun close() {
        scanner.close()
    }

    private fun toScannedBarcode(barcode: Barcode): ScannedBarcode? {
        val rawValue = barcode.rawValue
        if (rawValue.isNullOrBlank()) return null
        return ScannedBarcode(rawValue, barcode.format)
    }

    companion object {
        private const val TAG = "BarcodeAnalyzer"
    }
}
