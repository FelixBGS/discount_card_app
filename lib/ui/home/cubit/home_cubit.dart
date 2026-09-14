import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:discount_card_app/ui/home/cubit/home_state.dart';
import 'package:discount_card_app/ui/models/discount_card_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final DiscountCardRepository _repository;

  HomeCubit(this._repository) : super(const HomeState());

  void init() {
    changeSelectedFilter(null);
  }

  Future<void> changeQuery(String newQuery) async {
    emit(state.copyWith(searchQuery: newQuery));

    try {
      final cards = await _repository.searchCardsByFilters(
        state.searchQuery,
        state.selectedFilter,
      );
      final uiCards = cards.map((card) => card.toUi()).toList();
      emit(state.copyWith(discountCards: uiCards));
    } catch (e) {
      // TODO add error handling
    }
  }

  Future<void> changeSelectedFilter(CardCategoryType? selectedFilter) async {
    emit(state.copyWith(selectedFilter: () => selectedFilter));

    try {
      final cards = await _repository.searchCardsByFilters(
        state.searchQuery,
        state.selectedFilter,
      );
      final uiCards = cards.map((card) => card.toUi()).toList();
      emit(state.copyWith(discountCards: uiCards));
    } catch (e) {
      // TODO add error handling
    }
  }
}
