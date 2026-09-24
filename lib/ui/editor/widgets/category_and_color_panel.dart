import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/shared/ui/category_selector.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../../domain/models/card_color.dart';
import '../../shared/ui/panel_container.dart';
import '../../util/utils.dart';
import 'color_selector.dart';

class CategoryAndColorPanel extends StatelessWidget {
  const CategoryAndColorPanel({
    super.key,
    required this.selectedCategoryType,
    required this.onCategoryTypeChanged,
    this.selectedColor,
    required this.onColorChanged,
    this.colorErrorText,
  });

  final CardCategory selectedCategoryType;
  final VoidCallback onCategoryTypeChanged;
  final CardColor? selectedColor;
  final ValueChanged<CardColor> onColorChanged;
  final String? colorErrorText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return PanelContainer(
      borderColor: colorScheme.outline,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.categoryTitle, style: textTheme.titleSmall),
          const SizedBox(height: AppSpacing.sm),
          CategorySelector(
            categoryType: selectedCategoryType,
            onPressed: onCategoryTypeChanged,
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(context.l10n.cardColor, style: textTheme.titleSmall),
          const SizedBox(height: AppSpacing.sm),
          ColorSelector(
            colors: CardColor.selectable,
            onColorSelected: onColorChanged,
            selectedColor: selectedColor,
          ),
          if (colorErrorText != null) ...[
            const SizedBox(height: AppSpacing.sm),
            Text(
              colorErrorText!,
              style: textTheme.bodySmall?.copyWith(color: colorScheme.error),
            ),
          ],
        ],
      ),
    );
  }
}

@Preview(
  name: "Category And Color Panel",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget categoryAndColorPanelPreview() => SizedBox(
  width: 500,
  child: CategoryAndColorPanel(
    selectedCategoryType: CardCategory.unknown,
    onCategoryTypeChanged: () {},
    onColorChanged: (_) {},
  ),
);
