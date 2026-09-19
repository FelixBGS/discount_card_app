import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/state/home_notifier.dart';
import 'package:discount_card_app/ui/home/widgets/home_app_bar.dart';
import 'package:discount_card_app/ui/home/widgets/home_cards_list.dart';
import 'package:discount_card_app/ui/home/widgets/home_filters_section.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/app_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: SliverToBoxAdapter(
              child: Consumer(
                builder: (context, ref, _) {
                  return AppSearchBar(
                    hintText: context.l10n.searchCardsHint,
                    icon: Icons.search_rounded,
                    onChanged: (newQuery) => ref
                        .read(homeFilterProvider.notifier)
                        .setQuery(newQuery),
                  );
                },
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: SliverToBoxAdapter(child: HomeFiltersSection()),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.md)),
          const SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg),
            sliver: HomeCardsList(),
          ),
        ],
      ),
    );
  }
}
