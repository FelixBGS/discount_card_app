import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/state/home_notifier.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_panel.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_shimmer.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/themes/card_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/card_category_ui.dart';

class HomeCardsList extends ConsumerWidget {
  const HomeCardsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardsResult = ref.watch(discountCardsProvider);
    return cardsResult.when(
      skipLoadingOnReload: true,
      data: (cards) {
        return SliverList.separated(
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.sm),
          itemCount: cards.length,
          itemBuilder: (context, index) {
            final discountCard = cards[index];
            return DiscountCardPanel(
              key: ValueKey(discountCard.id),
              logo: discountCard.logo,
              shopName: discountCard.shopName,
              categoryName: discountCard.category.label(context.l10n),
              color: context.cardPalette.resolve(discountCard.color),
              onPressed: () {},
            );
          },
        );
      },
      error: (error, _) {
        return SliverToBoxAdapter(child: Text(error.toString()));
      },
      loading: () {
        return SliverList.separated(
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.sm),
          itemCount: 5,
          itemBuilder: (context, index) => const DiscountCardShimmer(),
        );
      },
    );
  }
}
