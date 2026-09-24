import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:flutter/services.dart';

const barcodeScannerViewType = 'barcode_scanner';

List<String> get barcodeScannerFormats => [
  for (final format in BarcodeFormat.values)
    if (format != BarcodeFormat.unknown) format.name,
];

sealed class ScannerWireEvent {
  const ScannerWireEvent();
}

class ScannerWireCode extends ScannerWireEvent {
  const ScannerWireCode({required this.value, required this.format});

  final String value;
  final BarcodeFormat format;
}

class ScannerWireRejected extends ScannerWireEvent {
  const ScannerWireRejected();
}

sealed class CameraStartResult {
  const CameraStartResult();
}

class CameraStarted extends CameraStartResult {
  const CameraStarted(this.torchAvailable);

  final bool torchAvailable;
}

class CameraStartIgnored extends CameraStartResult {
  const CameraStartIgnored();
}

class CameraInitializationException implements Exception {
  const CameraInitializationException();
}

class TorchUnavailableException implements Exception {
  const TorchUnavailableException();
}

class TorchFailedException implements Exception {
  const TorchFailedException();
}

class BarcodeScannerSessionFactory {
  BarcodeScannerSession create(int viewId) => BarcodeScannerSession(viewId);
}

class BarcodeScannerSession {
  BarcodeScannerSession(int viewId)
    : _methods = MethodChannel('$barcodeScannerViewType/methods/$viewId'),
      _events = EventChannel('$barcodeScannerViewType/events/$viewId');

  final MethodChannel _methods;
  final EventChannel _events;

  Stream<ScannerWireEvent> events() {
    return _events.receiveBroadcastStream().map(_decode);
  }

  Future<CameraStartResult> start() {
    return _invoke(() async {
      final result = await _methods.invokeMapMethod<Object?, Object?>('start');
      return CameraStarted(result?['torchAvailable'] == true);
    });
  }

  Future<void> stop() async {
    try {
      await _methods.invokeMethod<void>('stop');
    } on PlatformException catch (error) {
      if (_isBenign(error.code)) return;
      rethrow;
    }
  }

  Future<void> setTorch(bool enabled) async {
    try {
      await _methods.invokeMethod<void>('setTorch', {'enabled': enabled});
    } on PlatformException catch (error) {
      switch (error.code) {
        case 'torch_unavailable':
          throw const TorchUnavailableException();
        case 'torch_failed':
          throw const TorchFailedException();
        case 'cancelled':
        case 'camera_disposed':
        case 'camera_not_running':
          return;
        default:
          throw const TorchFailedException();
      }
    }
  }

  Future<CameraStartResult> _invoke(
    Future<CameraStartResult> Function() action,
  ) async {
    try {
      return await action();
    } on PlatformException catch (error) {
      switch (error.code) {
        case 'cancelled':
        case 'camera_disposed':
        case 'camera_already_starting':
        case 'camera_start_interrupted':
          return const CameraStartIgnored();
        default:
          throw const CameraInitializationException();
      }
    }
  }

  ScannerWireEvent _decode(Object? event) {
    if (event is! Map) return const ScannerWireRejected();
    final value = event['value'];
    final formatName = event['format'];
    if (value is! String || value.trim().isEmpty || formatName is! String) {
      return const ScannerWireRejected();
    }
    for (final format in BarcodeFormat.values) {
      if (format.name == formatName) {
        return ScannerWireCode(value: value, format: format);
      }
    }
    return const ScannerWireRejected();
  }

  bool _isBenign(String code) {
    return code == 'cancelled' ||
        code == 'camera_disposed' ||
        code == 'camera_already_starting' ||
        code == 'camera_start_interrupted';
  }
}
