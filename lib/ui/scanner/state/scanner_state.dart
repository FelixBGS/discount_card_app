import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/ui/scanner/platform/camera_permission_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'scanner_state.freezed.dart';

@freezed
class ScannerState with _$ScannerState {
  const ScannerState({
    this.permission = ScannerPermission.unknown,
    this.phase = const ScannerPhaseIdle(),
    this.torch = ScannerTorch.hidden,
    this.pendingBarcode,
    this.rejectionId = 0,
  });

  final ScannerPermission permission;
  final ScannerPhase phase;
  final ScannerTorch torch;
  final ({String value, BarcodeFormat format})? pendingBarcode;
  final int rejectionId;
}

enum ScannerTorch { hidden, off, on }

@freezed
sealed class ScannerPhase with _$ScannerPhase {
  const factory ScannerPhase.idle() = ScannerPhaseIdle;

  const factory ScannerPhase.starting() = ScannerPhaseStarting;

  const factory ScannerPhase.running() = ScannerPhaseRunning;

  const factory ScannerPhase.stopped() = ScannerPhaseStopped;

  const factory ScannerPhase.failed() = ScannerPhaseFailed;
}
