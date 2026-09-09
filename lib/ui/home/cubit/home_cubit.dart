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

  void changeQuery(String newQuery) {
    emit(state.copyWith(searchQuery: newQuery));
  }

  Future<void> changeSelectedFilter(CardCategoryType? selectedFilter) async {
    emit(state.copyWith(selectedFilter: () => selectedFilter, isLoading: true));

    try {
      final cards = await _repository.searchCardsByType(selectedFilter);
      final uiCards = cards.map((card) => card.toUi()).toList();
      emit(state.copyWith(discountCards: uiCards, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
