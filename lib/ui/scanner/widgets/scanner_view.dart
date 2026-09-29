import 'dart:async';

import 'package:discount_card_app/domain/models/barcode.dart';
import 'package:discount_card_app/ui/scanner/controller/scanner_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScannerView extends StatefulWidget {
  const ScannerView({
    super.key,
    this.onCreated,
    this.onBarcode,
    this.onReady,
    this.onCameraError,
    this.onDataError,
    this.isTorchEnabled = false,
    this.onTorchError,
  });

  final ValueChanged<ScannerController>? onCreated;
  final ValueChanged<Barcode>? onBarcode;
  final VoidCallback? onReady;
  final void Function(String? message)? onCameraError;
  final ValueChanged<String?>? onDataError;
  final bool isTorchEnabled;
  final void Function(String? message)? onTorchError;

  @override
  State<StatefulWidget> createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  ScannerController? _controller;
  StreamSubscription? _barcodeSub;

  bool _nativeTorchState = false;

  @override
  void didUpdateWidget(covariant ScannerView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_controller != null &&
        oldWidget.isTorchEnabled != widget.isTorchEnabled) {
      _applyTorchState();
    }
  }

  Future<void> _applyTorchState() async {
    if (_nativeTorchState == widget.isTorchEnabled) return;

    try {
      await _controller?.setTorch(enabled: widget.isTorchEnabled);
      _nativeTorchState = widget.isTorchEnabled;
    } on PlatformException catch (e) {
      widget.onTorchError?.call(e.message ?? 'Failed to set torch state');
    }
  }

  Future<void> _onPlatformViewCreated(int viewId) async {
    _controller = ScannerController(viewId);
    widget.onCreated?.call(_controller!);

    try {
      await _controller?.startScanner();
      widget.onReady?.call();
      if (widget.isTorchEnabled) {
        _applyTorchState();
      }
    } on PlatformException catch (e) {
      widget.onCameraError?.call(e.message);
    }

    _barcodeSub = _controller!.barcodeStream.listen(
      widget.onBarcode,
      onError: (error) => widget.onDataError?.call(error.toString()),
      cancelOnError: false,
    );
  }

  @override
  void dispose() {
    _barcodeSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AndroidView(
      viewType: ScannerConstants.viewType,
      onPlatformViewCreated: _onPlatformViewCreated,
    );
  }
}
