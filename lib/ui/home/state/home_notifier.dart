import 'dart:async';

import 'package:discount_card_app/core/di/injection.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/ui/home/state/home_filters.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeFiltersNotifier extends Notifier<HomeFilters> {
  Timer? _debounce;

  @override
  HomeFilters build() {
    ref.onDispose(() => _debounce?.cancel);
    return const HomeFilters();
  }

  void setQuery(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      state = state.copyWith(searchQuery: query);
    });
  }

  void setCategory(CardCategoryType? category) {
    state = state.copyWith(selectedCategory: category);
  }
}

final homeFilterProvider = NotifierProvider<HomeFiltersNotifier, HomeFilters>(
  HomeFiltersNotifier.new,
);

final discountCardsProvider = StreamProvider.autoDispose((ref) {
  final filters = ref.watch(homeFilterProvider);
  return ref
      .watch(discountCardRepositoryProvider)
      .watchCardsByFilters(filters.searchQuery, filters.selectedCategory);
});
