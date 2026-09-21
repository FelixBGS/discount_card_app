import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/contrast_icon.dart';
import 'package:discount_card_app/ui/shared/ui/panel_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../models/card_category_ui.dart';
import '../../util/utils.dart';

class CategorySelectorPanel extends StatelessWidget {
  const CategorySelectorPanel({super.key, required this.categoryType});

  final CardCategoryType categoryType;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return PanelContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ContrastIcon.icon(categoryType.icon),
          const SizedBox(width: AppSpacing.md),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(context.l10n.categoryTitle, style: textTheme.titleSmall),
              Text(
                categoryType.label(context.l10n),
                style: textTheme.titleMedium,
              ),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }
}

@Preview(
  name: "Category Selector Panel",
  group: "Editor Screen",
  theme: appPreviewTheme,
  localizations: appPreviewLocalizations,
)
Widget categorySelectorPanelPreview() => SizedBox(
  width: 500,
  child: CategorySelectorPanel(categoryType: CardCategoryType.entertainment),
);
