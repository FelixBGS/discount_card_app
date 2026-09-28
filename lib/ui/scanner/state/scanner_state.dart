import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_state.freezed.dart';

@freezed
sealed class ScannerState with _$ScannerState {
  const factory ScannerState.initial() = ScanerInitialState;

  const factory ScannerState.requiredPermission() =
      ScannerRequiredPermissionState;

  const factory ScannerState.permissionPermanentlyDenied() =
      ScannerPermissionPermanentlyDeniedState;

  const factory ScannerState.permissionGranted() = ScannerPermissionGranted;

  const factory ScannerState.cameraRunning({
    @Default(false) bool isTorchEnabled,
    String? torchFailureMessage,
    String? barcodeFailureMessage,
  }) = ScannerCameraRunningState;

  const factory ScannerState.cameraError({required String message}) =
      ScannerCameraErrorState;

  const factory ScannerState.dataSuccess({
    required String barcodeNumber,
    required BarcodeFormat barcodeFormat,
  }) = ScannerDataSuccessState;
}
