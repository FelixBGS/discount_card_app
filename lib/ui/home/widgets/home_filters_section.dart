import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/state/home_notifier.dart';
import 'package:discount_card_app/ui/home/widgets/filter_container.dart';
import 'package:discount_card_app/ui/models/card_category_ui.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFiltersSection extends ConsumerWidget {
  const HomeFiltersSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(
      homeFilterProvider.select((filters) => filters.selectedCategory),
    );
    final filters = [null, ...CardCategoryType.values];

    return Wrap(
      spacing: AppSpacing.sm,
      children: filters
          .map(
            (category) => FilterContainer(
              filterName: category == null
                  ? context.l10n.allFilter
                  : category.label(context.l10n),
              onSelected: (_) =>
                  ref.read(homeFilterProvider.notifier).setCategory(category),
              isSelected: selectedCategory == category,
            ),
          )
          .toList(),
    );
  }
}
