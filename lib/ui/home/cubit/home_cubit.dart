import 'dart:async';

import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:discount_card_app/ui/home/cubit/home_state.dart';
import 'package:discount_card_app/ui/models/discount_card_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/discount_card.dart';

class HomeCubit extends Cubit<HomeState> {
  final DiscountCardRepository _repository;

  HomeCubit(this._repository) : super(const HomeState());

  StreamSubscription<List<DiscountCard>>? _cardSubscription;

  Timer? _searchDebounceTimer;

  void init() {
    _subscribeToCards();
  }

  Future<void> changeSearchQuery(String newQuery) async {
    emit(state.copyWith(searchQuery: newQuery));

    _searchDebounceTimer?.cancel();
    _searchDebounceTimer = Timer(const Duration(milliseconds: 300), () {
      _subscribeToCards();
    });
  }

  Future<void> changeSelectedCategory(
    CardCategoryType? selectedCategory,
  ) async {
    emit(state.copyWith(selectedCategory: () => selectedCategory));
    _subscribeToCards();
  }

  void _subscribeToCards() {
    _cardSubscription?.cancel();

    _cardSubscription = _repository
        .watchCardsByFilters(state.searchQuery, state.selectedCategory)
        .listen(
          (cards) {
            if (isClosed) return;
            final uiCards = cards.map((card) => card.toUi()).toList();
            emit(
              state.copyWith(discountCards: uiCards, status: HomeDataSuccess()),
            );
          },
          onError: (error) {
            emit(state.copyWith(status: HomeDataError(error.toString())));
          },
        );
  }

  @override
  Future<void> close() {
    _searchDebounceTimer?.cancel();
    _cardSubscription?.cancel();
    return super.close();
  }
}
