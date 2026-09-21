import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/editor/widgets/category_selector.dart';
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
  });

  final CardCategoryType selectedCategoryType;
  final VoidCallback onCategoryTypeChanged;
  final CardColor? selectedColor;
  final VoidCallback onColorChanged;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    return PanelContainer(
      borderColor: colorScheme.outline,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(context.l10n.categoryTitle, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          CategorySelector(categoryType: selectedCategoryType),
          const SizedBox(height: AppSpacing.lg),
          Text(context.l10n.cardColor, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          ColorSelector(
            colors: CardColor.selectable,
            onColorSelected: (color) {},
            selectedColor: null,
          ),
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
Widget categorySelectorPanelPreview() => SizedBox(
  width: 500,
  child: CategoryAndColorPanel(
    selectedCategoryType: CardCategoryType.unknown,
    onCategoryTypeChanged: () {},
    onColorChanged: () {},
  ),
);
