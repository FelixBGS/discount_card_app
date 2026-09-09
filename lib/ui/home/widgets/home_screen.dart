import 'package:discount_card_app/l10n/l10n.dart';
import 'package:discount_card_app/ui/home/cubit/home_cubit.dart';
import 'package:discount_card_app/ui/home/widgets/home_app_bar.dart';
import 'package:discount_card_app/ui/home/widgets/home_cards_list.dart';
import 'package:discount_card_app/ui/home/widgets/home_filters_section.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/ui/app_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppSearchBar(
              hintText: context.l10n.searchCardsHint,
              icon: Icons.search_rounded,
              onChanged: (query) => context.read<HomeCubit>().changeQuery(query),
            ),
            const SizedBox(height: AppSpacing.md),
            const HomeFiltersSection(),
            const SizedBox(height: AppSpacing.md),
            const Expanded(
              child: HomeCardsList(),
            ),
          ],
        ),
      ),
    );
  }
}
