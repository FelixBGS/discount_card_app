import '../../../domain/models/barcode.dart';

sealed class ScannerEvent {
  const ScannerEvent();
}

final class ScannerInitialized extends ScannerEvent {
  const ScannerInitialized();
}

final class ScannerPermissionRequestPressed extends ScannerEvent {
  const ScannerPermissionRequestPressed();
}

final class ScannerOpenSettingsPressed extends ScannerEvent {
  const ScannerOpenSettingsPressed();
}

final class ScannerTorchPressed extends ScannerEvent {
  const ScannerTorchPressed();
}

final class ScannerBarcodeDetected extends ScannerEvent {
  const ScannerBarcodeDetected({required this.barcode});

  final Barcode barcode;
}

final class ScannerStarted extends ScannerEvent {
  const ScannerStarted();
}

final class ScannerCameraErrorOccurred extends ScannerEvent {
  const ScannerCameraErrorOccurred({required this.message});

  final String message;
}

final class ScannerDataErrorOccurred extends ScannerEvent {
  const ScannerDataErrorOccurred({required this.message});

  final String message;
}

final class ScannerTorchErrorOccurred extends ScannerEvent {
  const ScannerTorchErrorOccurred({required this.message});

  final String message;
}
