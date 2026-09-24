package com.example.discount_card_app.scanner.camera

import androidx.camera.core.Camera
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.Preview
import androidx.camera.lifecycle.ProcessCameraProvider

internal sealed interface CameraState {
    data object Idle : CameraState

    class Starting : CameraState

    data class Running(
        val provider: ProcessCameraProvider,
        val camera: Camera,
        val preview: Preview,
        val analysis: ImageAnalysis,
    ) : CameraState

    data object Disposed : CameraState
}