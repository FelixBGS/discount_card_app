import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/ui/editor/widgets/barcode_panel.dart';
import 'package:discount_card_app/ui/editor/widgets/category_and_color_panel.dart';
import 'package:discount_card_app/ui/editor/widgets/editor_app_bar.dart';
import 'package:discount_card_app/ui/editor/widgets/icon_and_name_panel.dart';
import 'package:discount_card_app/ui/shared/ui/app_button.dart';
import 'package:discount_card_app/ui/shared/ui/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../../l10n/l10n.dart';
import '../../shared/themes/app_dimensions.dart';
import '../../util/utils.dart';

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key, this.descriptionController});

  final TextEditingController? descriptionController;

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  TextEditingController? _internalDescriptionController;

  TextEditingController get _descriptionController =>
      widget.descriptionController ??
      (_internalDescriptionController ??= TextEditingController());

  @override
  void didUpdateWidget(EditorScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.descriptionController == null &&
        widget.descriptionController != null) {
      _internalDescriptionController?.dispose();
      _internalDescriptionController = null;
    }
  }

  @override
  void dispose() {
    _internalDescriptionController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: const EditorAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconAndNamePanel(
                    logo: LogoSource.empty(),
                    onChangeIconPressed: () {},
                    onNameChanged: () {},
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  CategoryAndColorPanel(
                    selectedCategoryType: CardCategoryType.unknown,
                    onCategoryTypeChanged: () {},
                    onColorChanged: () {},
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  BarcodePanel(
                    barcode: "4601234567893",
                    barcodeFormat: BarcodeFormat.qrCode,
                    onEditPressed: () {},
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    context.l10n.cardDescriptionLabel,
                    style: textTheme.titleMedium,
                  ),
                  AppTextField(
                    controller: _descriptionController,
                    maxLength: 200,
                    minLines: 3,
                    maxLines: 6,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppButton(
                    onPressed: () {},
                    text: context.l10n.save,
                    backgroundColor: colorScheme.primary,
                    textColor: colorScheme.onPrimary,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  AppButton(
                    onPressed: () {},
                    text: context.l10n.deleteCard,
                    backgroundColor: Colors.transparent,
                    textColor: colorScheme.error,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

@Preview(
  name: "Editor Screen",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget editorScreenPreview() => SizedBox(
  width: 600,
  height: 1200,
  child: Container(color: Color(0xFFF7F8FC), child: EditorScreen()),
);
