import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/models/home_state.dart';
import 'package:discount_card_app/ui/home/widgets/home_app_bar.dart';
import 'package:discount_card_app/ui/home/widgets/home_cards_list.dart';
import 'package:discount_card_app/ui/home/widgets/home_filters_section.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/app_search_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      state: const HomeState(),
      onSearchQueryChanged: (_) {},
      onSelectedCategoryChanged: (_) {},
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.state,
    required this.onSearchQueryChanged,
    required this.onSelectedCategoryChanged,
    super.key,
  });

  final HomeState state;
  final ValueChanged<String> onSearchQueryChanged;
  final ValueChanged<CardCategoryType?> onSelectedCategoryChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: SliverToBoxAdapter(
              child: AppSearchBar(
                hintText: context.l10n.searchCardsHint,
                icon: Icons.search_rounded,
                onChanged: onSearchQueryChanged,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: SliverToBoxAdapter(
              child: HomeFiltersSection(
                selectedCategory: state.selectedCategory,
                onSelectedCategoryChanged: onSelectedCategoryChanged,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: HomeCardsList(
              status: state.status,
              discountCards: state.discountCards,
            ),
          ),
        ],
      ),
    );
  }
}
