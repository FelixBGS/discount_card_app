import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/widgets/filter_container.dart';
import 'package:discount_card_app/ui/models/card_category_ui.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class HomeFiltersSection extends StatelessWidget {
  const HomeFiltersSection({
    required this.selectedCategory,
    required this.onSelectedCategoryChanged,
    super.key,
  });

  final CardCategoryType? selectedCategory;
  final ValueChanged<CardCategoryType?> onSelectedCategoryChanged;

  @override
  Widget build(BuildContext context) {
    final filters = [null, ...CardCategoryType.values];

    return Wrap(
      spacing: AppSpacing.sm,
      children: filters
          .map(
            (category) => FilterContainer(
              filterName: category == null
                  ? context.l10n.allFilter
                  : category.label(context.l10n),
              onSelected: (_) => onSelectedCategoryChanged(category),
              isSelected: selectedCategory == category,
            ),
          )
          .toList(),
    );
  }
}
