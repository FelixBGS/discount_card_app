import 'package:discount_card_app/core/di/injection.dart';
import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/domain/service/logo_file_service.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/editor/widgets/shop_icon_selector.dart';
import 'package:discount_card_app/ui/shared/ui/panel_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import '../../shared/themes/app_dimensions.dart';
import '../../shared/ui/app_button.dart';
import '../../shared/ui/universal_icon.dart';
import '../../utils/preview_utils.dart';

class IconEditBottomSheet extends StatefulWidget {
  const IconEditBottomSheet({
    super.key,
    required this.selectedLogo,
    required this.popularLogos,
  });

  final LogoSource selectedLogo;
  final List<LogoSource> popularLogos;

  static Future<LogoSource?> show(
    BuildContext context, {
    required LogoSource selectedLogo,
    required List<LogoSource> popularLogos,
  }) {
    return showModalBottomSheet<LogoSource>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (_) => IconEditBottomSheet(
        selectedLogo: selectedLogo,
        popularLogos: popularLogos,
      ),
    );
  }

  @override
  State<StatefulWidget> createState() => IconEditBottomSheetState();
}

class IconEditBottomSheetState extends State<IconEditBottomSheet> {
  late LogoSource _selectedLogo;
  late final List<LogoSource> _popularLogos;
  bool _isPicking = false;

  @override
  void initState() {
    super.initState();
    _selectedLogo = widget.selectedLogo;
    _popularLogos = widget.popularLogos;
  }

  Future<void> _pickFromGallery() async {
    if (_isPicking) return;
    _isPicking = true;
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked == null || !mounted) return;

      final persisted = await getIt<LogoFileService>().persistLocal(
        picked.path,
      );
      if (!mounted) return;
      setState(() => _selectedLogo = persisted);
    } finally {
      _isPicking = false;
    }
  }

  void _submit() => context.pop(_selectedLogo);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final mediaQuery = MediaQuery.of(context);
    final bottomInset =
        mediaQuery.padding.bottom + mediaQuery.viewInsets.bottom;

    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(
        AppSpacing.lg,
        AppSpacing.md,
        AppSpacing.lg,
        AppSpacing.md + bottomInset,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.editIconTitle,
                  style: textTheme.titleMedium,
                ),
              ),
              IconButton(
                onPressed: () => context.pop(null),
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UniversalIcon(
                logo: _selectedLogo,
                width: AppSizes.logoLarge,
                height: AppSizes.logoLarge,
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: _pickFromGallery,
                    borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
                    child: PanelContainer(
                      borderColor: colorScheme.outlineVariant,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.photo_library_outlined),
                          Text(
                            context.l10n.pickFromGallery,
                            style: textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(context.l10n.popularLogos, style: textTheme.titleSmall),
          const SizedBox(height: AppSpacing.sm),
          SizedBox(
            height: AppSizes.logoMedium + AppSpacing.xxs * 2,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _popularLogos.length,
              separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.md),
              itemBuilder: (context, index) {
                final logo = _popularLogos[index];
                return ShopIconSelector(
                  logo: logo,
                  onPressed: () => setState(() => _selectedLogo = logo),
                );
              },
            ),
          ),
          const SizedBox(height: AppSpacing.lg),
          AppButton(
            onPressed: _submit,
            text: context.l10n.save,
            backgroundColor: colorScheme.primary,
            textColor: colorScheme.onPrimary,
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
  name: "Icon Edit Bottom Sheet",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
  wrapper: whiteBackgroundPreview,
)
Widget iconEditBottomSheetPreview() => const SizedBox(
  width: 400,
  child: IconEditBottomSheet(
    selectedLogo: LogoSource.empty(),
    popularLogos: [
      LogoSource.empty(),
      LogoSource.asset("assets/images/icons/ic_barcode_scanner.svg"),
      LogoSource.asset("assets/images/icons/ic_question_mark_circle.svg"),
      LogoSource.empty(),
      LogoSource.asset("assets/images/icons/ic_barcode_scanner.svg"),
      LogoSource.asset("assets/images/icons/ic_question_mark_circle.svg"),
    ],
  ),
);
