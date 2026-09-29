import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/models/card_category_ui.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/themes/card_palette.dart';
import 'package:discount_card_app/ui/shared/ui/contrast_icon.dart';
import 'package:discount_card_app/ui/shared/ui/panel_container.dart';
import 'package:discount_card_app/ui/utils/preview_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class CategorySelector extends StatelessWidget {
  CategorySelector({
    super.key,
    required CardCategoryType categoryType,
    this.onPressed,
    this.decoratedLeading = true,
  }) : _content = _CategoryContent(categoryType);

  CategorySelector.color({
    super.key,
    required CardColor color,
    this.onPressed,
    this.decoratedLeading = true,
  }) : _content = _ColorContent(color);

  CategorySelector.info({
    super.key,
    required String title,
    required String value,
    required IconData icon,
    this.onPressed,
    this.decoratedLeading = true,
  }) : _content = _InfoContent(title: title, value: value, icon: icon);

  final VoidCallback? onPressed;
  final bool decoratedLeading;
  final _SelectorContent _content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final l10n = context.l10n;
    final tap = onPressed;
    final content = _content;

    final resolvedTitle = switch (content) {
      _CategoryContent() => l10n.categoryTitle,
      _ColorContent() => l10n.cardColor,
      _InfoContent(:final title) => title,
    };
    final rawValue = switch (content) {
      _CategoryContent(:final categoryType) => categoryType.label(l10n),
      _ColorContent() => null,
      _InfoContent(:final value) => value,
    };
    final resolvedValue = rawValue == null || rawValue.isEmpty
        ? null
        : rawValue;

    final row = PanelContainer(
      padding: AppSpacing.sm,
      borderColor: colorScheme.outlineVariant,
      child: Row(
        children: [
          _leading(context),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  resolvedTitle,
                  style: resolvedValue == null
                      ? textTheme.titleMedium
                      : textTheme.titleSmall,
                ),
                if (resolvedValue != null)
                  Text(
                    resolvedValue,
                    style: content is _InfoContent
                        ? textTheme.bodyLarge
                        : textTheme.titleMedium,
                  ),
              ],
            ),
          ),
          if (tap != null) ...[
            const SizedBox(width: AppSpacing.sm),
            const Icon(Icons.arrow_forward_ios),
          ],
        ],
      ),
    );

    if (tap == null) return row;

    return GestureDetector(onTap: tap, child: row);
  }

  Widget _leading(BuildContext context) {
    return switch (_content) {
      _ColorContent(:final color) => _ColorDot(
        color: context.cardPalette.resolve(color),
        decorated: decoratedLeading,
      ),
      _CategoryContent(:final categoryType) => _SelectorIcon(
        icon: categoryType.icon,
        decorated: decoratedLeading,
      ),
      _InfoContent(:final icon) => _SelectorIcon(
        icon: icon,
        decorated: decoratedLeading,
      ),
    };
  }
}

class _ColorDot extends StatelessWidget {
  const _ColorDot({required this.color, required this.decorated});

  final Color color;
  final bool decorated;

  @override
  Widget build(BuildContext context) {
    final dot = Container(
      width: AppSizes.iconSmall,
      height: AppSizes.iconSmall,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
    if (!decorated) return dot;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.secondary,
      ),
      child: dot,
    );
  }
}

class _SelectorIcon extends StatelessWidget {
  const _SelectorIcon({required this.icon, required this.decorated});

  final IconData icon;
  final bool decorated;

  @override
  Widget build(BuildContext context) {
    if (!decorated) return Icon(icon, size: AppSizes.iconSmall);

    return ContrastIcon.icon(icon, size: AppSizes.iconSmall);
  }
}

sealed class _SelectorContent {
  const _SelectorContent();
}

final class _CategoryContent extends _SelectorContent {
  const _CategoryContent(this.categoryType);

  final CardCategoryType categoryType;
}

final class _ColorContent extends _SelectorContent {
  const _ColorContent(this.color);

  final CardColor color;
}

final class _InfoContent extends _SelectorContent {
  const _InfoContent({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;
}

@Preview(
  name: "Category Selector Panel",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget categorySelectorPanelPreview() => SizedBox(
  width: 500,
  child: CategorySelector(
    categoryType: CardCategoryType.entertainment,
    onPressed: () {},
  ),
);

@Preview(
  name: "Category Selector Color",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget categorySelectorColorPreview() => SizedBox(
  width: 500,
  child: CategorySelector.color(color: CardColor.red, decoratedLeading: false),
);
