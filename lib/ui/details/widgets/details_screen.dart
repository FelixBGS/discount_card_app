import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/details/state/details_state.dart';
import 'package:discount_card_app/ui/models/card_category_ui.dart';
import 'package:discount_card_app/ui/router/app_router.dart';
import 'package:discount_card_app/ui/shared/themes/app_colors.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/themes/card_palette.dart';
import 'package:discount_card_app/ui/shared/ui/app_barcode.dart';
import 'package:discount_card_app/ui/shared/ui/app_button.dart';
import 'package:discount_card_app/ui/shared/ui/category_selector.dart';
import 'package:discount_card_app/ui/shared/ui/universal_icon.dart';
import 'package:discount_card_app/ui/utils/preview_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widget_previews.dart';
import 'package:go_router/go_router.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.cardId});

  final String cardId;

  @override
  Widget build(BuildContext context) {
    // TODO(riverpod): закрывать экран, когда статус карты становится DetailsStatus.missing (карту удалили в редакторе).
    // TODO(riverpod): подписаться на состояние карты с идентификатором cardId.
    const state = DetailsState();

    final card = state.card;
    if (card != null) {
      return DetailsContent(
        card: card,
        onEdit: () => _openEditor(context, card.id),
      );
    }

    return switch (state.status) {
      DetailsStatus.loading => const _DetailsPlaceholder(
        child: CircularProgressIndicator(),
      ),
      _ => const _DetailsLoadError(),
    };
  }
}

class DetailsContent extends StatelessWidget {
  const DetailsContent({super.key, required this.card, required this.onEdit});

  final DiscountCard card;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final colorScheme = Theme.of(context).colorScheme;
    final background = context.cardPalette.resolve(card.color);
    final description = card.description?.trim();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: _overlayFor(background),
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _DetailsHeader(
                      logo: card.logo,
                      shopName: card.shopName,
                      categoryName: card.category.label(l10n),
                      backgroundColor: background,
                    ),
                    Transform.translate(
                      offset: const Offset(0, -_DetailsHeader.overlap),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.lg,
                        ),
                        child: Column(
                          children: [
                            _BarcodeCard(
                              barcode: card.barcode,
                              format: card.barcodeFormat,
                            ),
                            const SizedBox(height: AppSpacing.lg),
                            CategorySelector(
                              categoryType: card.category,
                              decoratedLeading: false,
                            ),
                            const SizedBox(height: AppSpacing.sm),
                            CategorySelector.color(
                              color: card.color,
                              decoratedLeading: false,
                            ),
                            if (description != null &&
                                description.isNotEmpty) ...[
                              const SizedBox(height: AppSpacing.sm),
                              CategorySelector.info(
                                title: l10n.cardDescriptionLabel,
                                value: description,
                                icon: Icons.description_outlined,
                                decoratedLeading: false,
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.lg,
                  AppSpacing.sm,
                  AppSpacing.lg,
                  AppSpacing.md,
                ),
                child: AppButton(
                  onPressed: onEdit,
                  text: l10n.edit,
                  backgroundColor: colorScheme.primary,
                  textColor: colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DetailsHeader extends StatelessWidget {
  const _DetailsHeader({
    required this.logo,
    required this.shopName,
    required this.categoryName,
    required this.backgroundColor,
  });

  static const overlap = 48.0;

  final LogoSource logo;
  final String shopName;
  final String categoryName;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final foreground = _foregroundOn(backgroundColor);

    return ColoredBox(
      color: backgroundColor,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(bottom: overlap + AppSpacing.xl),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () => context.pop(),
                color: foreground,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: AppSizes.iconSmall,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
                child: Row(
                  children: [
                    _LogoBadge(logo: logo),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            shopName,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleLarge?.copyWith(
                              color: foreground,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.xs),
                          Text(
                            categoryName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.titleMedium?.copyWith(
                              color: foreground.withValues(alpha: 0.9),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _LogoBadge extends StatelessWidget {
  const _LogoBadge({required this.logo});

  final LogoSource logo;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: AppSizes.logoMedium,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 8,
            ),
          ],
        ),
        child: ClipOval(
          child: ColoredBox(
            color: Colors.white,
            child: UniversalIcon(
              logo: logo,
              width: AppSizes.logoMedium,
              height: AppSizes.logoMedium,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

class _BarcodeCard extends StatelessWidget {
  const _BarcodeCard({required this.barcode, required this.format});

  final String barcode;
  final BarcodeFormat format;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.md,
          vertical: AppSpacing.lg,
        ),
        child: AppBarcode(data: barcode, format: format),
      ),
    );
  }
}

class _DetailsPlaceholder extends StatelessWidget {
  const _DetailsPlaceholder({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios, size: AppSizes.iconSmall),
        ),
      ),
      body: Center(child: child),
    );
  }
}

class _DetailsLoadError extends StatelessWidget {
  const _DetailsLoadError();

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return _DetailsPlaceholder(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(context.l10n.cardLoadError, textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.md),
            AppButton(
              // TODO(riverpod): повторить загрузку карты.
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

bool _isLight(Color color) => color.computeLuminance() > 0.5;

Color _foregroundOn(Color background) =>
    _isLight(background) ? AppColors.textPrimary : Colors.white;

SystemUiOverlayStyle _overlayFor(Color background) {
  final lightBackground = _isLight(background);
  return SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: lightBackground
        ? Brightness.dark
        : Brightness.light,
    statusBarBrightness: lightBackground ? Brightness.light : Brightness.dark,
  );
}

Future<void> _openEditor(BuildContext context, String cardId) async {
  await EditorCardRouteData(cardId: cardId).push(context);
  // TODO(riverpod): обновить карту после возврата из редактора.
}

@Preview(
  name: "Details",
  group: "Details Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget detailsScreenPreview() => const SizedBox(
  width: 400,
  height: 840,
  child: DetailsContent(
    card: DiscountCard(
      id: "preview",
      shopName: "Пятёрочка",
      category: CardCategoryType.supermarket,
      color: CardColor.red,
      barcode: "4601234567893",
      barcodeFormat: BarcodeFormat.ean13,
      logo: LogoSource.asset("assets/images/icons/pyaterochka.svg"),
      description: "Скидки и акции в магазинах Пятёрочка",
    ),
    onEdit: _previewEdit,
  ),
);

void _previewEdit() {}
