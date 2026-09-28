import 'package:flutter/services.dart';

import '../../../domain/models/barcode.dart';
import 'barcode_mapper.dart';

class ScannerController {
  ScannerController(this.viewId) {
    _eventChannel = EventChannel(
      "${ScannerConstants.eventsChannelPrefix}/$viewId",
    );
    _methodChannel = MethodChannel(
      "${ScannerConstants.methodsChannelPrefix}/$viewId",
    );
  }

  final int viewId;
  late final EventChannel _eventChannel;
  late final MethodChannel _methodChannel;

  late final Stream<Barcode> barcodeStream = _eventChannel
      .receiveBroadcastStream()
      .map((dynamic event) {
        if (event is Map) {
          return BarcodeMapper.fromMap(event);
        }
        throw Exception(
          "Expected Map from EventChannel, got ${event.runtimeType}",
        );
      });

  Future<void> startScanner() async {
    await _methodChannel.invokeMethod<void>(ScannerConstants.methodStart);
  }

  Future<void> stopScanner() async {
    await _methodChannel.invokeMethod<void>(ScannerConstants.methodStop);
  }

  Future<void> setTorch({required bool enabled}) async {
    await _methodChannel.invokeMethod<void>(ScannerConstants.methodSetTorch, {
      ScannerConstants.argTorchEnabled: enabled,
    });
  }
}

abstract class ScannerConstants {
  static const String viewType = 'barcode_scanner';

  static const String methodsChannelPrefix = '$viewType/methods';
  static const String eventsChannelPrefix = '$viewType/events';

  static const String methodStart = 'start';
  static const String methodStop = 'stop';
  static const String methodSetTorch = 'setTorch';

  static const String argTorchEnabled = 'enabled';
  static const String paramFormats = 'formats';

  static const String eventKeyValue = 'value';
  static const String eventKeyFormat = 'format';
}
