import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:discount_card_app/ui/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final DiscountCardRepository _repository;

  HomeCubit(this._repository) : super(const HomeState()) {
    changeSelectedFilter(state.selectedFilter);
  }

  void changeQuery(String newQuery) {
    emit(state.copyWith(searchQuery: newQuery));
  }

  Future<void> changeSelectedFilter(CardCategoryType? selectedFilter) async {
    emit(state.copyWith(selectedFilter: () => selectedFilter));

    try {
      final cards = await _repository.searchCardsByType(selectedFilter);
      emit(state.copyWith(discountCards: cards));
    } catch (e) {
      // ignore error
    }
  }
}
