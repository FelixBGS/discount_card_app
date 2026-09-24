package com.example.discount_card_app.scanner.camera

sealed class CameraError(
    val code: String,
    message: String,
    cause: Throwable? = null,
) : Exception(message, cause) {

    class InitializationFailed(cause: Throwable) : CameraError(
        code = "camera_initialization_failed",
        message = cause.message ?: "Failed to initialize camera",
        cause = cause,
    )

    class AlreadyStarting : CameraError(
        code = "camera_already_starting",
        message = "Camera is already starting",
    )

    class StartInterrupted : CameraError(
        code = "camera_start_interrupted",
        message = "Camera start was interrupted by stop or dispose",
    )

    class NotRunning : CameraError(
        code = "camera_not_running",
        message = "Camera is not running",
    )

    class Disposed : CameraError(
        code = "camera_disposed",
        message = "Camera has been disposed",
    )

    class TorchUnavailable : CameraError(
        code = "torch_unavailable",
        message = "Torch is not available on this camera",
    )

    class TorchFailed(cause: Throwable) : CameraError(
        code = "torch_failed",
        message = cause.message ?: "Failed to change torch state",
        cause = cause,
    )
}
