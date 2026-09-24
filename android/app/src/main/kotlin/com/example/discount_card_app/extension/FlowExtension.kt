package com.example.discount_card_app.extension

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow
import kotlin.time.Duration
import kotlin.time.TimeSource

fun <T, K> Flow<T>.throttleFirstBy(
    window: Duration,
    keySelector: (T) -> K
): Flow<T> = flow {
    var lastKey: K? = null
    var lastEmission: TimeSource.Monotonic.ValueTimeMark? = null
    collect { value ->
        val currentKey = keySelector(value)
        val previousEmission = lastEmission
        val isDifferentKey = currentKey != lastKey
        val isWindowExpired = previousEmission == null || previousEmission.elapsedNow() >= window
        if (isDifferentKey || isWindowExpired) {
            lastKey = currentKey
            lastEmission = TimeSource.Monotonic.markNow()
            emit(value)
        }
    }
}
