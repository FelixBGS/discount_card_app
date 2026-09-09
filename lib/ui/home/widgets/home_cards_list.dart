import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/cubit/home_cubit.dart';
import 'package:discount_card_app/ui/home/cubit/home_state.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_panel.dart';
import 'package:discount_card_app/ui/home/widgets/discount_card_shimmer.dart';
import 'package:discount_card_app/ui/models/card_category_ui.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCardsList extends StatelessWidget {
  const HomeCardsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        if (state.isLoading) {
          return ListView.separated(
            separatorBuilder: (context, index) =>
                const SizedBox(height: AppSpacing.sm),
            itemCount: 5,
            itemBuilder: (context, index) => const DiscountCardShimmer(),
          );
        }

        return ListView.separated(
          separatorBuilder: (context, index) =>
              const SizedBox(height: AppSpacing.sm),
          itemCount: state.discountCards.length,
          itemBuilder: (context, index) {
            final discountCard = state.discountCards[index];
            return DiscountCardPanel(
              key: ValueKey(discountCard.id),
              iconUrl: discountCard.iconUrl,
              fallbackIconAsset: discountCard.localIconAsset,
              shopName: discountCard.shopName,
              categoryName: discountCard.category.label(context.l10n),
              color: discountCard.backgroundColor,
              onPressed: () => {},
            );
          },
        );
      },
    );
  }
}
