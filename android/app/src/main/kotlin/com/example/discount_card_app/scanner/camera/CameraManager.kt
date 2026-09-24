package com.example.discount_card_app.scanner.camera

import android.content.Context
import android.view.ViewGroup
import androidx.camera.core.CameraSelector
import androidx.camera.core.ImageAnalysis
import androidx.camera.core.Preview
import androidx.camera.lifecycle.ProcessCameraProvider
import androidx.camera.view.PreviewView
import androidx.lifecycle.LifecycleOwner
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.guava.await
import kotlinx.coroutines.withContext
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import kotlin.coroutines.cancellation.CancellationException

class CameraManager(
    private val context: Context,
    private val lifecycleOwner: LifecycleOwner,
    private val mainDispatcher: CoroutineDispatcher = Dispatchers.Main.immediate,
) {
    val previewView: PreviewView = PreviewView(context).apply {
        layoutParams = ViewGroup.LayoutParams(
            ViewGroup.LayoutParams.MATCH_PARENT,
            ViewGroup.LayoutParams.MATCH_PARENT
        )
        implementationMode = PreviewView.ImplementationMode.COMPATIBLE
        scaleType = PreviewView.ScaleType.FILL_CENTER
    }

    private val analysisExecutor: ExecutorService = Executors.newSingleThreadExecutor()

    private var state: CameraState = CameraState.Idle

    suspend fun start(analyzer: ImageAnalysis.Analyzer): Result<Boolean> = withContext(mainDispatcher) {
        when (val current = state) {
            is CameraState.Running ->
                return@withContext Result.success(current.camera.cameraInfo.hasFlashUnit())
            is CameraState.Starting -> return@withContext Result.failure(CameraError.AlreadyStarting())
            CameraState.Disposed -> return@withContext Result.failure(CameraError.Disposed())
            CameraState.Idle -> Unit
        }

        val request = CameraState.Starting()
        state = request

        try {
            val provider = ProcessCameraProvider
                .getInstance(context)
                .await()

            if (state !== request) {
                return@withContext Result.failure(CameraError.StartInterrupted())
            }

            val preview = Preview.Builder()
                .build()
                .also { it.surfaceProvider = previewView.surfaceProvider }

            val analysis = ImageAnalysis.Builder()
                .setBackpressureStrategy(ImageAnalysis.STRATEGY_KEEP_ONLY_LATEST)
                .build()
                .also { it.setAnalyzer(analysisExecutor, analyzer) }

            val camera = provider.bindToLifecycle(
                lifecycleOwner,
                CameraSelector.DEFAULT_BACK_CAMERA,
                preview,
                analysis
            )

            state = CameraState.Running(
                provider = provider,
                camera = camera,
                preview = preview,
                analysis = analysis,
            )
            Result.success(camera.cameraInfo.hasFlashUnit())
        } catch (error: CancellationException) {
            if (state === request) state = CameraState.Idle
            throw error
        } catch (error: Exception) {
            if (state !== request) {
                return@withContext Result.failure(CameraError.StartInterrupted())
            }
            state = CameraState.Idle
            Result.failure(CameraError.InitializationFailed(error))
        }
    }

    suspend fun stop() = withContext(mainDispatcher) {
        when (val current = state) {
            CameraState.Idle, CameraState.Disposed -> Unit
            is CameraState.Starting -> state = CameraState.Idle
            is CameraState.Running -> {
                state = CameraState.Idle
                release(current)
            }
        }
    }

    suspend fun setTorch(enabled: Boolean): Result<Unit> = withContext(mainDispatcher) {
        val running = state as? CameraState.Running
            ?: return@withContext Result.failure(CameraError.NotRunning())

        if (!running.camera.cameraInfo.hasFlashUnit()) {
            return@withContext Result.failure(CameraError.TorchUnavailable())
        }

        try {
            running.camera.cameraControl.enableTorch(enabled).await()
            Result.success(Unit)
        } catch (error: CancellationException) {
            throw error
        } catch (error: Exception) {
            Result.failure(CameraError.TorchFailed(error))
        }
    }

    suspend fun dispose() = withContext(mainDispatcher) {
        val current = state

        if (current == CameraState.Disposed) return@withContext

        state = CameraState.Disposed

        if (current is CameraState.Running)
            release(current)

        analysisExecutor.shutdown()
    }

    private fun release(state: CameraState.Running) {
        state.analysis.clearAnalyzer()
        state.provider.unbind(state.preview, state.analysis)
    }
}
