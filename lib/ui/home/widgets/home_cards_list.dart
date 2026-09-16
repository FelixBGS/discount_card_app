import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/models/home_state.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_panel.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_shimmer.dart';
import 'package:discount_card_app/ui/models/discount_card_ui.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../models/card_category_ui.dart';

class HomeCardsList extends StatelessWidget {
  const HomeCardsList({
    required this.status,
    required this.discountCards,
    super.key,
  });

  final HomeDataStatus status;
  final List<DiscountCardUi> discountCards;

  @override
  Widget build(BuildContext context) {
    if (status is HomeDataInitial) {
      return SliverList.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSpacing.sm),
        itemCount: 5,
        itemBuilder: (context, index) => const DiscountCardShimmer(),
      );
    }

    return SliverList.separated(
      separatorBuilder: (context, index) =>
          const SizedBox(height: AppSpacing.sm),
      itemCount: discountCards.length,
      itemBuilder: (context, index) {
        final discountCard = discountCards[index];
        return DiscountCardPanel(
          key: ValueKey(discountCard.id),
          logo: discountCard.logo,
          shopName: discountCard.shopName,
          categoryName: discountCard.category.label(context.l10n),
          color: discountCard.backgroundColor,
          onPressed: () => {},
        );
      },
    );
  }
}
