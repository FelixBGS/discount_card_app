import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/state/home_state.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_panel.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_shimmer.dart';
import 'package:discount_card_app/ui/models/card_category_ui.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/themes/card_palette.dart';
import 'package:flutter/material.dart';

class HomeCardsList extends StatelessWidget {
  const HomeCardsList({
    required this.status,
    required this.discountCards,
    super.key,
  });

  final HomeDataStatus status;
  final List<DiscountCard> discountCards;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      HomeDataInitial() => SliverList.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(height: AppSpacing.sm),
        itemCount: 5,
        itemBuilder: (context, index) => const DiscountCardShimmer(),
      ),
      HomeDataError() => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: Text(context.l10n.cardsLoadError)),
      ),
      HomeDataSuccess() when discountCards.isEmpty => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: Text(context.l10n.cardsEmpty)),
      ),
      HomeDataSuccess() => SliverList.separated(
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
            color: context.cardPalette.resolve(discountCard.color),
            onPressed: () {},
          );
        },
      ),
    };
  }
}
