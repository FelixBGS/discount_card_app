import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/shared/ui/app_button.dart';
import 'package:discount_card_app/ui/shared/ui/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';

import '../../models/barcode_format_codec.dart';
import '../../shared/themes/app_dimensions.dart';
import '../../util/utils.dart';

class BarcodeEditResult {
  const BarcodeEditResult({required this.barcode, required this.format});

  final String barcode;
  final BarcodeFormat format;
}

class BarcodeEditBottomSheet extends StatefulWidget {
  const BarcodeEditBottomSheet({
    super.key,
    this.barcode,
    required this.barcodeFormat,
  });

  final String? barcode;
  final BarcodeFormat barcodeFormat;

  static Future<BarcodeEditResult?> show(
    BuildContext context,
    String? barcode,
    BarcodeFormat format,
  ) {
    return showModalBottomSheet<BarcodeEditResult>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) =>
          BarcodeEditBottomSheet(barcode: barcode, barcodeFormat: format),
    );
  }

  @override
  State<StatefulWidget> createState() => _BarcodeEditBottomSheetState();
}

class _BarcodeEditBottomSheetState extends State<BarcodeEditBottomSheet> {
  late final TextEditingController _controller;
  late BarcodeFormat _format;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _format = widget.barcodeFormat;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  bool get _digitsOnly =>
      _format == BarcodeFormat.ean8 || _format == BarcodeFormat.ean13;

  bool get _canSave =>
      BarcodeFormatCodec.isValid(_format, _controller.text.trim());

  void _onFormatChanged(BarcodeFormat format) {
    setState(() {
      _format = format;
    });
  }

  void _submit() {
    if (!_canSave) return;
    context.pop(
      BarcodeEditResult(barcode: _controller.text.trim(), format: _format),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final bottomInset = MediaQuery.viewInsetsOf(context).bottom;

    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.md + bottomInset,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.editBarcodeNumberBottomSheet,
                  style: textTheme.titleLarge,
                ),
              ),
              IconButton(
                onPressed: () => context.pop(null),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(
            context.l10n.instructionEditBarcodeNumberBottomSheet,
            style: textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(context.l10n.barcodeNumberTitle, style: textTheme.titleMedium),
          AppTextField(
            controller: _controller,
            showClearButton: true,
            keyboardType: _digitsOnly
                ? TextInputType.number
                : TextInputType.text,
            inputFormatters: [
              if (_digitsOnly) FilteringTextInputFormatter.digitsOnly,
              if (_format == BarcodeFormat.ean8)
                LengthLimitingTextInputFormatter(8),
              if (_format == BarcodeFormat.ean13)
                LengthLimitingTextInputFormatter(13),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Text(context.l10n.barcodeFormatTitle, style: textTheme.titleMedium),
          DropdownButtonFormField<BarcodeFormat>(
            initialValue: _format,
            decoration: const InputDecoration(hoverColor: Colors.transparent),
            items: [
              for (final format in BarcodeFormat.values)
                if (format != BarcodeFormat.unknown)
                  DropdownMenuItem(
                    value: format,
                    child: Text(format.toString()),
                  ),
            ],
            onChanged: (format) {
              if (format != null) _onFormatChanged(format);
            },
          ),
          const SizedBox(height: AppSpacing.lg),
          ListenableBuilder(
            listenable: _controller,
            builder: (context, _) {
              return AppButton(
                onPressed: _canSave ? _submit : null,
                text: context.l10n.save,
                backgroundColor: colorScheme.primary,
                textColor: colorScheme.onPrimary,
              );
            },
          ),
          const SizedBox(height: AppSpacing.sm),
          AppButton(
            onPressed: () => context.pop(),
            text: context.l10n.cancel,
            backgroundColor: Colors.transparent,
            textColor: colorScheme.onSecondary,
          ),
        ],
      ),
    );
  }
}

@Preview(
  name: "Barcode Edit Bottom Sheet",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
  wrapper: whiteBackgroundPreview,
)
Widget barcodeEditBottomSheetPreview() => const SizedBox(
  width: 400,
  child: BarcodeEditBottomSheet(
    barcode: "4601234567893",
    barcodeFormat: BarcodeFormat.ean13,
  ),
);
