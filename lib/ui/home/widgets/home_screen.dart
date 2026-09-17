import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/state/home_action.dart';
import 'package:discount_card_app/ui/home/widgets/home_app_bar.dart';
import 'package:discount_card_app/ui/home/widgets/home_cards_list.dart';
import 'package:discount_card_app/ui/home/widgets/home_filters_section.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/app_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../../store/app_state.dart';
import '../models/cards_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context, listen: false);
    return HomeScreen(
      onSearchQueryChanged: (newQuery) {
        store.dispatch(QueryChanged(newQuery: newQuery));
      },
      onSelectedCategoryChanged: (selectedCategory) {
        store.dispatch(CategoryChanged(selectedCategory));
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    required this.onSearchQueryChanged,
    required this.onSelectedCategoryChanged,
    super.key,
  });

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
              child: StoreConnector<AppState, CardCategoryType?>(
                distinct: true,
                converter: (store) => store.state.homeState.selectedCategory,
                builder: (context, selectedCategory) {
                  return HomeFiltersSection(
                    selectedCategory: selectedCategory,
                    onSelectedCategoryChanged: onSelectedCategoryChanged,
                  );
                },
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: StoreConnector<AppState, CardsViewModel>(
              distinct: true,
              converter: (store) => CardsViewModel(
                status: store.state.homeState.status,
                discountCards: store.state.homeState.discountCards,
              ),
              builder: (context, vm) {
                return HomeCardsList(
                  status: vm.status,
                  discountCards: vm.discountCards,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
