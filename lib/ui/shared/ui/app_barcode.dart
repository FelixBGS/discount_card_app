import 'dart:math' as math;

import 'package:barcode_widget/barcode_widget.dart';
import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../models/barcode_format_codec.dart';
import '../../util/utils.dart';
import '../themes/app_dimensions.dart';

class AppBarcode extends StatelessWidget {
  const AppBarcode({super.key, required this.data, required this.format});

  final String data;
  final BarcodeFormat format;

  @override
  Widget build(BuildContext context) {
    final payload = data.trim();

    if (payload.isEmpty) {
      return _BarcodePlaceholder(message: context.l10n.barcodeEmptyPlaceholder);
    }

    if (format == BarcodeFormat.unknown) {
      return _BarcodePlaceholder(
        message: context.l10n.barcodeUnknownPlaceholder,
        caption: payload,
      );
    }

    final encoder = BarcodeFormatCodec.encoder(format);
    if (encoder == null || !BarcodeFormatCodec.isValid(format, payload)) {
      return _BarcodePlaceholder(
        message: context.l10n.barcodeInvalidPlaceholder,
        caption: payload,
      );
    }

    final graphic = BarcodeFormatCodec.isTwoDimensional(format)
        ? _QrGraphic(encoder: encoder, data: data)
        : _LinearGraphic(encoder: encoder, data: data);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        graphic,
        const SizedBox(height: AppSpacing.sm),
        Text(
          payload,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}

class _BarcodePlaceholder extends StatelessWidget {
  const _BarcodePlaceholder({required this.message, this.caption});

  final String message;
  final String? caption;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: AppSizes.barcodeLinearHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.qr_code_2, size: AppSizes.iconLarge),
              const SizedBox(height: AppSpacing.xs),
              Text(
                message,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        if (caption != null && caption!.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.sm),
          Text(
            caption!,
            textAlign: TextAlign.center,
            style: textTheme.titleSmall,
          ),
        ],
      ],
    );
  }
}

class _LinearGraphic extends StatelessWidget {
  const _LinearGraphic({required this.encoder, required this.data});

  final Barcode encoder;
  final String data;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: AppSpacing.md),
      child: SizedBox(
        height: AppSizes.barcodeLinearHeight,
        child: BarcodeWidget(
          data: data,
          barcode: encoder,
          drawText: false,
          color: colorScheme.onSurface,
          backgroundColor: colorScheme.surface,
          errorBuilder: (context, error) => _BarcodePlaceholder(
            message: context.l10n.barcodeInvalidPlaceholder,
          ),
        ),
      ),
    );
  }
}

class _QrGraphic extends StatelessWidget {
  const _QrGraphic({required this.encoder, required this.data});

  final Barcode encoder;
  final String data;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = math.min(constraints.maxWidth, AppSizes.barcodeQrSize);
        return Center(
          child: SizedBox(
            width: size,
            height: size,
            child: BarcodeWidget(
              barcode: encoder,
              data: data,
              drawText: false,
              color: colorScheme.onSurface,
              backgroundColor: colorScheme.surface,
              errorBuilder: (context, error) => _BarcodePlaceholder(
                message: context.l10n.barcodeInvalidPlaceholder,
              ),
            ),
          ),
        );
      },
    );
  }
}

@Preview(
  name: "EAN-13",
  group: "App Barcode",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
  wrapper: whiteBackgroundPreview,
)
Widget appBarcodeEan13Preview() => const SizedBox(
  width: 360,
  child: AppBarcode(data: "4601234567893", format: BarcodeFormat.ean13),
);

@Preview(
  name: "QR",
  group: "App Barcode",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
  wrapper: whiteBackgroundPreview,
)
Widget appBarcodeQrPreview() => const SizedBox(
  width: 360,
  child: AppBarcode(data: "4601234567893", format: BarcodeFormat.qrCode),
);

@Preview(
  name: "Unknown",
  group: "App Barcode",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
  wrapper: whiteBackgroundPreview,
)
Widget appBarcodeUnknownPreview() => const SizedBox(
  width: 360,
  child: AppBarcode(data: "4601234567893", format: BarcodeFormat.unknown),
);

@Preview(
  name: "Empty",
  group: "App Barcode",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
  wrapper: whiteBackgroundPreview,
)
Widget appBarcodeEmptyPreview() => const SizedBox(
  width: 360,
  child: AppBarcode(data: "", format: BarcodeFormat.ean13),
);

@Preview(
  name: "Invalid",
  group: "App Barcode",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
  wrapper: whiteBackgroundPreview,
)
Widget appBarcodeInvalidPreview() => const SizedBox(
  width: 360,
  child: AppBarcode(data: "4601234567890", format: BarcodeFormat.ean13),
);
