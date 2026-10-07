import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/state/home_state.dart';
import 'package:discount_card_app/ui/home/widgets/filter_container.dart';
import 'package:discount_card_app/ui/models/card_category_ui.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class HomeFiltersSection extends StatelessWidget {
  const HomeFiltersSection({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO(riverpod): подписаться только на выбранную категорию из состояния главного экрана.
    final selectedFilter = const HomeState().selectedCategory;
    final filters = [null, ...CardCategoryType.values];

    return Wrap(
      spacing: AppSpacing.sm,
      children: filters
          .map(
            (category) => FilterContainer(
              filterName: category == null
                  ? context.l10n.allFilter
                  : category.label(context.l10n),
              // TODO(riverpod): передать выбранную категорию в состояние главного экрана.
              onSelected: (_) {},
              isSelected: selectedFilter == category,
            ),
          )
          .toList(),
    );
  }
}
