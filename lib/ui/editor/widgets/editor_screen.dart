import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/ui/editor/state/editor_args.dart';
import 'package:discount_card_app/ui/editor/widgets/barcode_edit_bottom_sheet.dart';
import 'package:discount_card_app/ui/editor/widgets/barcode_panel.dart';
import 'package:discount_card_app/ui/editor/widgets/category_and_color_panel.dart';
import 'package:discount_card_app/ui/editor/widgets/category_filter_screen.dart';
import 'package:discount_card_app/ui/editor/widgets/editor_app_bar.dart';
import 'package:discount_card_app/ui/editor/widgets/icon_and_name_panel.dart';
import 'package:discount_card_app/ui/editor/widgets/icon_edit_bottom_sheet.dart';
import 'package:discount_card_app/ui/shared/ui/app_button.dart';
import 'package:discount_card_app/ui/shared/ui/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';

import '../../../l10n/l10n.dart';
import '../../shared/themes/app_dimensions.dart';
import '../../utils/preview_utils.dart';
import '../state/editor_state.dart';

class EditorScreen extends StatelessWidget {
  const EditorScreen({super.key, this.args = const EditorArgs.blank()});

  final EditorArgs args;

  @override
  Widget build(BuildContext context) {
    // TODO(riverpod): подписаться на статус редактора, созданного из args.
    const state = EditorState();

    return Scaffold(
      appBar: const EditorAppBar(),
      body: switch (state.status) {
        EditorStatus.loading => const Center(
          child: CircularProgressIndicator(),
        ),
        EditorStatus.ready => _EditorForm(
          shopName: state.shopName,
          description: state.description,
          isEditing: state.cardId != null,
        ),
        EditorStatus.error => const _EditorLoadError(),
      },
    );
  }
}

class _EditorLoadError extends StatelessWidget {
  const _EditorLoadError();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.l10n.cardLoadError, textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.md),
            AppButton(
              // TODO(riverpod): повторить загрузку редактируемой карты.
              onPressed: () {},
              text: context.l10n.retry,
              backgroundColor: colorScheme.primary,
              textColor: colorScheme.onPrimary,
            ),
          ],
        ),
      ),
    );
  }
}

class _EditorForm extends StatefulWidget {
  const _EditorForm({
    required this.shopName,
    required this.description,
    required this.isEditing,
  });

  final String shopName;
  final String description;
  final bool isEditing;

  @override
  State<_EditorForm> createState() => _EditorFormState();
}

class _EditorFormState extends State<_EditorForm> {
  late final TextEditingController _shopNameController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _shopNameController = TextEditingController(text: widget.shopName);
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  void dispose() {
    _shopNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _editIcon() async {
    // TODO(riverpod): взять текущий логотип из состояния редактора.
    const state = EditorState();
    final logo = await IconEditBottomSheet.show(
      context,
      selectedLogo: state.selectedLogo,
      popularLogos: popularLogos,
    );
    if (!mounted || logo == null) return;
    // TODO(riverpod): передать logo в состояние редактора.
  }

  Future<void> _editCategory() async {
    // TODO(riverpod): взять текущую категорию из состояния редактора.
    const state = EditorState();
    final category = await CategoryFilterScreen.show(
      context,
      selectedCategory: state.selectedCategory,
    );
    if (!mounted || category == null) return;
    // TODO(riverpod): передать category в состояние редактора.
  }

  Future<void> _editBarcode() async {
    // TODO(riverpod): взять текущий штрихкод и формат из состояния редактора.
    const state = EditorState();
    final result = await BarcodeEditBottomSheet.show(
      context,
      state.barcodeNumber,
      state.barcodeFormat,
    );
    if (!mounted || result == null) return;
    // TODO(riverpod): передать result.barcode и result.format в состояние редактора.
  }

  Future<void> _onSave() async {
    // TODO(riverpod): передать текст из _shopNameController и _descriptionController в редактор, сохранить карту и закрыть экран только при успешной валидации.
  }

  Future<void> _onDelete() async {
    // TODO(riverpod): удалить карту через редактор, затем закрыть экран.
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    // TODO(riverpod): заменить на точечные подписки (логотип и ошибка имени; категория, цвет и ошибка цвета; штрихкод, формат и ошибка штрихкода), чтобы панели перестраивались независимо.
    const state = EditorState();

    return SafeArea(
      top: false,
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconAndNamePanel(
                    logo: state.selectedLogo,
                    shopName: widget.shopName,
                    controller: _shopNameController,
                    errorText: state.fieldErrors.shopName
                        ? context.l10n.shopNameRequiredError
                        : null,
                    onChangeIconPressed: _editIcon,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  CategoryAndColorPanel(
                    selectedCategoryType: state.selectedCategory,
                    selectedColor: state.selectedColor,
                    colorErrorText: state.fieldErrors.color
                        ? context.l10n.cardColorRequiredError
                        : null,
                    onCategoryTypeChanged: () {
                      _editCategory();
                    },
                    // TODO(riverpod): передать выбранный цвет в состояние редактора.
                    onColorChanged: (color) {},
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  BarcodePanel(
                    barcode: state.barcodeNumber,
                    barcodeFormat: state.barcodeFormat,
                    errorText: state.fieldErrors.barcode
                        ? context.l10n.barcodeInvalidError
                        : null,
                    onEditPressed: _editBarcode,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Text(
                    context.l10n.cardDescriptionLabel,
                    style: textTheme.titleSmall,
                  ),
                  AppTextField(
                    controller: _descriptionController,
                    maxLength: 200,
                    minLines: 3,
                    maxLines: 6,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  AppButton(
                    onPressed: _onSave,
                    text: context.l10n.save,
                    backgroundColor: colorScheme.primary,
                    textColor: colorScheme.onPrimary,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  AppButton(
                    onPressed: widget.isEditing
                        ? _onDelete
                        : () => context.pop(),
                    text: widget.isEditing
                        ? context.l10n.deleteCard
                        : context.l10n.cancel,
                    backgroundColor: Colors.transparent,
                    textColor: widget.isEditing
                        ? colorScheme.error
                        : colorScheme.onSurface,
                  ),
                  const SizedBox(height: AppSpacing.md),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const List<LogoSource> popularLogos = [
  LogoSource.asset("assets/images/icons/appletv.svg"),
  LogoSource.asset("assets/images/icons/aptekaru.svg"),
  LogoSource.asset("assets/images/icons/chizhik.svg"),
  LogoSource.asset("assets/images/icons/dodopizza.svg"),
  LogoSource.asset("assets/images/icons/domclick.svg"),
  LogoSource.asset("assets/images/icons/kari.svg"),
  LogoSource.asset("assets/images/icons/kfc.svg"),
  LogoSource.asset("assets/images/icons/krasnoeibeloe.svg"),
  LogoSource.asset("assets/images/icons/lamoda.svg"),
  LogoSource.asset("assets/images/icons/lg.svg"),
  LogoSource.asset("assets/images/icons/magnit.svg"),
  LogoSource.asset("assets/images/icons/magnitapteka.svg"),
  LogoSource.asset("assets/images/icons/mcdonalds.svg"),
  LogoSource.asset("assets/images/icons/netflix.svg"),
  LogoSource.asset("assets/images/icons/perekrestok.svg"),
  LogoSource.asset("assets/images/icons/pyaterochka.svg"),
  LogoSource.asset("assets/images/icons/rostics.svg"),
  LogoSource.asset("assets/images/icons/samsung.svg"),
  LogoSource.asset("assets/images/icons/starbucks.svg"),
  LogoSource.asset("assets/images/icons/tvoe.svg"),
  LogoSource.asset("assets/images/icons/twitch.svg"),
  LogoSource.asset("assets/images/icons/xiaomi.svg"),
  LogoSource.asset("assets/images/icons/zdravcity.svg"),
];

@Preview(
  name: "Editor Screen",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget editorScreenPreview() => SizedBox(
  width: 600,
  height: 1200,
  child: Container(
    color: const Color(0xFFF7F8FC),
    child: const EditorScreen(),
  ),
);
