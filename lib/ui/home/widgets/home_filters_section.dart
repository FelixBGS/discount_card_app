import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/state/home_cubit.dart';
import 'package:discount_card_app/ui/home/state/home_state.dart';
import 'package:discount_card_app/ui/home/widgets/filter_container.dart';
import 'package:discount_card_app/ui/models/card_category_ui.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeFiltersSection extends StatelessWidget {
  const HomeFiltersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, CardCategoryType?>(
      selector: (state) => state.selectedCategory,
      builder: ((context, selectedFilter) {
        final filters = [null, ...CardCategoryType.values];

        return Wrap(
          spacing: AppSpacing.sm,
          children: filters
              .map(
                (category) => FilterContainer(
                  filterName: category == null
                      ? context.l10n.allFilter
                      : category.label(context.l10n),
                  onSelected: (_) {
                    context.read<HomeCubit>().changeSelectedCategory(category);
                  },
                  isSelected: selectedFilter == category,
                ),
              )
              .toList(),
        );
      }),
    );
  }
}
