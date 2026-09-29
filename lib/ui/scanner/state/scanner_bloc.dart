import 'package:discount_card_app/ui/scanner/state/scanner_event.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc() : super(const ScannerState.initial()) {
    on<ScannerInitialized>(_onScannerInitialized);
    on<ScannerStarted>(_onScannerStarted);
    on<ScannerBarcodeDetected>(_onScannerBarcodeDetected);
    on<ScannerCameraErrorOccurred>(_onScannerCameraErrorOccurred);
    on<ScannerDataErrorOccurred>(_onScannerDataErrorOccurred);
    on<ScannerTorchErrorOccurred>(_onScannerTorchErrorOccurred);
    on<ScannerPermissionRequestPressed>(_onScannerPermissionRequestPressed);
    on<ScannerOpenSettingsPressed>(_onScannerOpenSettingsPressed);
    on<ScannerTorchPressed>(_onScannerTorchPressed);
  }

  Future<void> _onScannerInitialized(
    ScannerInitialized event,
    Emitter<ScannerState> emit,
  ) async {
    final status = await Permission.camera.status;
    await _evaluatePermissionStatus(status, emit);
  }

  void _onScannerStarted(ScannerStarted event, Emitter<ScannerState> emit) {
    emit(ScannerState.cameraRunning());
  }

  void _onScannerBarcodeDetected(
    ScannerBarcodeDetected event,
    Emitter<ScannerState> emit,
  ) {
    emit(
      ScannerState.dataSuccess(
        barcodeNumber: event.barcode.barcodeNumber,
        barcodeFormat: event.barcode.barcodeFormat,
      ),
    );
  }

  void _onScannerCameraErrorOccurred(
    ScannerCameraErrorOccurred event,
    Emitter<ScannerState> emit,
  ) {
    emit(ScannerState.cameraError(message: event.message));
  }

  void _onScannerDataErrorOccurred(
    ScannerDataErrorOccurred event,
    Emitter<ScannerState> emit,
  ) {
    final currentState = state;
    if (currentState is ScannerCameraRunningState) {
      emit(currentState.copyWith(barcodeFailureMessage: event.message));
    }
  }

  void _onScannerTorchErrorOccurred(
    ScannerTorchErrorOccurred event,
    Emitter<ScannerState> emit,
  ) {
    final currentState = state;
    if (currentState is ScannerCameraRunningState) {
      emit(
        currentState.copyWith(
          isTorchEnabled: false,
          torchFailureMessage: event.message,
        ),
      );
    }
  }

  void _onScannerTorchPressed(
    ScannerTorchPressed event,
    Emitter<ScannerState> emit,
  ) {
    final currentState = state;
    if (currentState is ScannerCameraRunningState) {
      emit(
        currentState.copyWith(
          isTorchEnabled: !currentState.isTorchEnabled,
          torchFailureMessage: null,
        ),
      );
    }
  }

  Future<void> _onScannerPermissionRequestPressed(
    ScannerPermissionRequestPressed event,
    Emitter<ScannerState> emit,
  ) async {
    final status = await Permission.camera.request();
    await _evaluatePermissionStatus(status, emit);
  }

  Future<void> _onScannerOpenSettingsPressed(
    ScannerOpenSettingsPressed event,
    Emitter<ScannerState> emit,
  ) async {
    await openAppSettings();
  }

  Future<void> _evaluatePermissionStatus(
    PermissionStatus status,
    Emitter<ScannerState> emit,
  ) async {
    if (status.isGranted) {
      emit(const ScannerState.permissionGranted());
      return;
    }

    if (status.isPermanentlyDenied) {
      emit(const ScannerState.permissionPermanentlyDenied());
      return;
    }

    if (status.isDenied && state is ScannerPermissionPermanentlyDeniedState) {
      return;
    }

    emit(const ScannerState.requiredPermission());
  }
}
