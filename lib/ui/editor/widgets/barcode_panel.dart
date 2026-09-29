import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/shared/ui/app_barcode.dart';
import 'package:discount_card_app/ui/shared/ui/panel_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../shared/themes/app_dimensions.dart';
import '../../utils/preview_utils.dart';

class BarcodePanel extends StatelessWidget {
  const BarcodePanel({
    super.key,
    required this.barcode,
    required this.barcodeFormat,
    required this.onEditPressed,
    this.errorText,
  });

  final String barcode;
  final BarcodeFormat barcodeFormat;
  final VoidCallback onEditPressed;
  final String? errorText;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final errorText = this.errorText;

    return PanelContainer(
      borderColor: errorText == null ? colorScheme.outline : colorScheme.error,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(context.l10n.barcodeTitle, style: textTheme.titleSmall),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            width: double.infinity,
            child: AppBarcode(data: barcode, format: barcodeFormat),
          ),
          const SizedBox(height: AppSpacing.md),
          _EditBarcodeRow(onPressed: onEditPressed),
          if (errorText != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              errorText,
              style: textTheme.bodySmall?.copyWith(color: colorScheme.error),
            ),
          ],
        ],
      ),
    );
  }
}

class _EditBarcodeRow extends StatelessWidget {
  const _EditBarcodeRow({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
        child: PanelContainer(
          borderColor: colorScheme.outlineVariant,
          child: Row(
            children: [
              Icon(Icons.edit_outlined),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Text(
                  context.l10n.editBarcodeNumber,
                  style: textTheme.bodySmall,
                ),
              ),
              const Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ),
    );
  }
}

@Preview(
  name: "EAN-13",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget barcodePanelEan13Preview() => SizedBox(
  width: 500,
  child: BarcodePanel(
    barcode: "4601234567893",
    barcodeFormat: BarcodeFormat.ean13,
    onEditPressed: () {},
  ),
);

@Preview(
  name: "QR",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget barcodePanelQrPreview() => SizedBox(
  width: 500,
  height: 400,
  child: BarcodePanel(
    barcode: "4601234567893",
    barcodeFormat: BarcodeFormat.qrCode,
    onEditPressed: () {},
  ),
);

@Preview(
  name: "Placeholder",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget barcodePanelPlaceholderPreview() => SizedBox(
  width: 500,
  child: BarcodePanel(
    barcode: "",
    barcodeFormat: BarcodeFormat.ean13,
    onEditPressed: () {},
  ),
);
