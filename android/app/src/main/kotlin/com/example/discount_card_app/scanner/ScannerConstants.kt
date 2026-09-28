package com.example.discount_card_app.scanner

object ScannerConstants {
    const val VIEW_TYPE = "barcode_scanner"

    const val METHODS_CHANNEL_PREFIX = "$VIEW_TYPE/methods"
    const val EVENTS_CHANNEL_PREFIX = "$VIEW_TYPE/events"

    const val METHOD_START = "start"
    const val METHOD_STOP = "stop"
    const val METHOD_SET_TORCH = "setTorch"

    const val ARG_TORCH_ENABLED = "enabled"
    const val PARAM_FORMATS = "formats"

    const val EVENT_KEY_VALUE = "value"
    const val EVENT_KEY_FORMAT = "format"
}