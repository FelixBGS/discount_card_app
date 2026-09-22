import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/ui/editor/state/editor_cubit.dart';
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
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/card_color.dart';
import '../../../l10n/l10n.dart';
import '../../shared/themes/app_dimensions.dart';
import '../../util/utils.dart';
import '../state/editor_state.dart';

class EditorPage extends StatelessWidget {
  const EditorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditorCubit(),
      child: const EditorScreen(),
    );
  }
}

class EditorScreen extends StatefulWidget {
  const EditorScreen({super.key});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _editIcon() async {
    final cubit = context.read<EditorCubit>();
    final logo = await IconEditBottomSheet.show(
      context,
      selectedLogo: cubit.state.selectedLogo,
      popularLogos: popularLogos,
    );
    if (!mounted || logo == null) return;
    cubit.changeLogo(logo);
  }

  Future<void> _editCategory() async {
    final cubit = context.read<EditorCubit>();
    final category = await CategoryFilterScreen.show(
      context,
      selectedCategory: cubit.state.selectedCategory,
    );
    if (!mounted || category == null) return;
    cubit.changeSelectedCategory(category);
  }

  Future<void> _editBarcode() async {
    final cubit = context.read<EditorCubit>();
    final result = await BarcodeEditBottomSheet.show(
      context,
      cubit.state.barcodeNumber,
      cubit.state.barcodeFormat,
    );
    if (!mounted || result == null) return;
    cubit.changeBarcodeNumberAndFormat(result.barcode, result.format);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: const EditorAppBar(),
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocSelector<EditorCubit, EditorState, LogoSource>(
                      selector: (s) => s.selectedLogo,
                      builder: (context, logo) {
                        return IconAndNamePanel(
                          logo: logo,
                          onChangeIconPressed: _editIcon,
                          onNameChanged: (_) {},
                        );
                      },
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    BlocSelector<
                      EditorCubit,
                      EditorState,
                      ({CardCategoryType category, CardColor? color})
                    >(
                      selector: (s) => (
                        category: s.selectedCategory,
                        color: s.selectedColor,
                      ),
                      builder: (context, panelInfo) {
                        return CategoryAndColorPanel(
                          selectedCategoryType: panelInfo.category,
                          selectedColor: panelInfo.color,
                          onCategoryTypeChanged: () {
                            _editCategory();
                          },
                          onColorChanged: context
                              .read<EditorCubit>()
                              .changeCardColor,
                        );
                      },
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    BlocSelector<
                      EditorCubit,
                      EditorState,
                      ({String barcodeNumber, BarcodeFormat barcodeFormat})
                    >(
                      selector: (s) => (
                        barcodeNumber: s.barcodeNumber,
                        barcodeFormat: s.barcodeFormat,
                      ),
                      builder: (context, barcodeInfo) {
                        return BarcodePanel(
                          barcode: barcodeInfo.barcodeNumber,
                          barcodeFormat: barcodeInfo.barcodeFormat,
                          onEditPressed: _editBarcode,
                        );
                      },
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
                    const SizedBox(height: AppSpacing.md),
                  ],
                ),
              ),
            ),
          ],
        ),
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
  child: Container(color: Color(0xFFF7F8FC), child: EditorScreen()),
);
