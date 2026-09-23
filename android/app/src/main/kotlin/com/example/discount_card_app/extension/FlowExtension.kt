package com.example.discount_card_app.extension

import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.flow

fun <T, K> Flow<T>.throttleFirstBy(
    windowDurationMillis: Long,
    keySelector: (T) -> K
): Flow<T> = flow {
    var lastKey: K? = null
    var lastEmissionTime = 0L
    collect { value ->
        val currentKey = keySelector(value)
        val currentTime = System.currentTimeMillis()
        val isDifferentKey = currentKey != lastKey
        val isWindowExpired = (currentTime - lastEmissionTime) >= windowDurationMillis
        if (isDifferentKey || isWindowExpired) {
            lastKey = currentKey
            lastEmissionTime = currentTime
            emit(value)
        }
    }
}