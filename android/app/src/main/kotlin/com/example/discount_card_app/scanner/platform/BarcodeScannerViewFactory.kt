package com.example.discount_card_app.scanner.platform

import android.content.Context
import androidx.lifecycle.LifecycleOwner
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class BarcodeScannerViewFactory(
    private val messenger: BinaryMessenger,
    private val lifecycleOwnerProvider: () -> LifecycleOwner?,
) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val lifecycleOwner = checkNotNull(lifecycleOwnerProvider()) {
            "Barcode scanner requires an attached Activity"
        }
        return BarcodeScannerPlatformView(
            context,
            messenger,
            viewId,
            args as? Map<*, *>,
            lifecycleOwner
        )
    }
}
