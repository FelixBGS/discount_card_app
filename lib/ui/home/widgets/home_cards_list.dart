import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/state/home_cubit.dart';
import 'package:discount_card_app/ui/home/state/home_state.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_panel.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_shimmer.dart';
import 'package:discount_card_app/ui/router/branches/home/details_route.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/themes/card_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/card_category_ui.dart';

class HomeCardsList extends StatelessWidget {
  const HomeCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      HomeCubit,
      HomeState,
      ({HomeDataStatus status, List<DiscountCard> discountCards})
    >(
      selector: (s) => (status: s.status, discountCards: s.discountCards),
      builder: (context, state) {
        if (state.status is HomeDataInitial) {
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
          itemCount: state.discountCards.length,
          itemBuilder: (context, index) {
            final discountCard = state.discountCards[index];
            return DiscountCardPanel(
              key: ValueKey(discountCard.id),
              logo: discountCard.logo,
              shopName: discountCard.shopName,
              categoryName: discountCard.category.label(context.l10n),
              color: context.cardPalette.resolve(discountCard.color),
              onPressed: () =>
                  DetailsRouteData(cardId: discountCard.id).go(context),
            );
          },
        );
      },
    );
  }
}
