import 'package:discount_card_app/data/models/card_category_type_api.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/cubit/home_cubit.dart';
import 'package:discount_card_app/ui/home/cubit/home_state.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_panel.dart';
import 'package:discount_card_app/ui/models/card_category_ui.dart';
import 'package:discount_card_app/ui/models/card_color_ui.dart';
import 'package:discount_card_app/ui/shared/themes/app_colors.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/app_search_bar.dart';
import 'package:discount_card_app/ui/home/widgets/filter_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.myCardsTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        titleSpacing: AppSpacing.lg,
        actionsPadding: const EdgeInsets.only(right: AppSpacing.lg),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: SvgPicture.asset(
              colorFilter: const ColorFilter.mode(
                AppColors.primary,
                BlendMode.srcIn,
              ),
              width: AppSizes.iconMedium,
              height: AppSizes.iconMedium,
              "assets/images/icons/ic_barcode_scanner.svg",
            ),
          ),
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.add, size: AppSizes.iconMedium),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSearchBar(
              hintText: context.l10n.searchCardsHint,
              icon: Icons.search_rounded,
            ),
            const SizedBox(height: AppSpacing.md),
            BlocSelector<HomeCubit, HomeState, CardCategoryType?>(
              selector: (state) => state.selectedFilter,
              builder: ((context, selectedFilter) {
                return Wrap(
                  spacing: AppSpacing.sm,
                  children: [null, ...CardCategoryType.values]
                      .map(
                        (category) => FilterContainer(
                          filterName: category.label(context.l10n),
                          onSelected: (_) {
                            context.read<HomeCubit>().changeSelectedFilter(
                              category,
                            );
                          },
                          isSelected: selectedFilter == category,
                        ),
                      )
                      .toList(),
                );
              }),
            ),
            const SizedBox(height: AppSpacing.md),
            Expanded(
              child: BlocSelector<HomeCubit, HomeState, List<DiscountCard>>(
                selector: (state) => state.discountCards,
                builder: (context, discountCards) {
                  return ListView.separated(
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: AppSpacing.sm),
                    itemCount: discountCards.length,
                    itemBuilder: (context, index) {
                      final discountCard = discountCards[index];
                      return DiscountCardPanel(
                        key: ValueKey(discountCard.id),
                        iconUrl: discountCard.logoUrl ?? "https://www.svgrepo.com/show/524853/question-circle.svg",
                        shopName: discountCard.shopName,
                        categoryName: discountCard.category.label(context.l10n),
                        color: discountCard.color.color,
                        onPressed: () => {},
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
