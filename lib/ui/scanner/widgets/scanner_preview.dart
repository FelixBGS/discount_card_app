import 'package:discount_card_app/ui/scanner/platform/barcode_scanner_session.dart';
import 'package:discount_card_app/ui/scanner/state/scanner_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScannerPreview extends StatelessWidget {
  const ScannerPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return AndroidView(
      viewType: barcodeScannerViewType,
      creationParams: {'formats': barcodeScannerFormats},
      creationParamsCodec: const StandardMessageCodec(),
      onPlatformViewCreated: context.read<ScannerCubit>().onViewCreated,
    );
  }
}
