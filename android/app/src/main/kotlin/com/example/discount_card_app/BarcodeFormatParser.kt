package com.example.discount_card_app

import com.google.mlkit.vision.barcode.BarcodeScannerOptions
import com.google.mlkit.vision.barcode.common.Barcode

object BarcodeFormatParser {
    private val FORMATS_BY_WIRE_NAME = mapOf(
        "ean8" to Barcode.FORMAT_EAN_8,
        "ean13" to Barcode.FORMAT_EAN_13,
        "code39" to Barcode.FORMAT_CODE_39,
        "code128" to Barcode.FORMAT_CODE_128,
        "qrCode" to Barcode.FORMAT_QR_CODE
    )
    private val DEFAULT_FORMATS = listOf(
        Barcode.FORMAT_EAN_8,
        Barcode.FORMAT_EAN_13,
        Barcode.FORMAT_CODE_39,
        Barcode.FORMAT_CODE_128,
        Barcode.FORMAT_QR_CODE
    )

    fun parse(rawFormats: Any?): BarcodeScannerOptions {
        val formats = when (rawFormats) {
            null -> DEFAULT_FORMATS
            is List<*> -> {
                if (rawFormats.isEmpty()) {
                    DEFAULT_FORMATS
                } else {
                    rawFormats.map { rawFormat ->
                        require(rawFormat is String) {
                            "Barcode format must be a string"
                        }
                        requireNotNull(FORMATS_BY_WIRE_NAME[rawFormat]) {
                            "Unsupported barcode format: $rawFormat"
                        }
                    }.distinct()
                }
            }
            else -> throw IllegalArgumentException("Barcode formats must be a list")
        }

        val builder = BarcodeScannerOptions.Builder()
        if (formats.size == 1) {
            builder.setBarcodeFormats(formats.first())
        } else {
            builder.setBarcodeFormats(formats.first(), *formats.drop(1).toIntArray())
        }
        return builder.build()
    }

    fun mapToString(format: Int): String = when (format) {
        Barcode.FORMAT_EAN_8 -> "ean8"
        Barcode.FORMAT_EAN_13 -> "ean13"
        Barcode.FORMAT_CODE_39 -> "code39"
        Barcode.FORMAT_CODE_128 -> "code128"
        Barcode.FORMAT_QR_CODE -> "qrCode"
        else -> "unknown"
    }
}