import 'dart:async';

import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:discount_card_app/ui/home/state/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class HomeCubit extends Cubit<HomeState> {
  final DiscountCardRepository _repository;
  StreamSubscription? _discountCardsSubscription;

  HomeCubit(this._repository) : super(const HomeState());

  void init() {
    final searchStream = stream
        .startWith(state)
        .map((s) => s.searchQuery)
        .distinct()
        .debounceTime(const Duration(milliseconds: 300));

    final categoryStream = stream
        .startWith(state)
        .map((s) => s.selectedCategory)
        .distinct();

    _discountCardsSubscription =
        Rx.combineLatest2(
              searchStream,
              categoryStream,
              (String query, CardCategory? category) => (query, category),
            )
            .switchMap((filters) {
              final (query, category) = filters;
              return _repository.watchCardsByFilters(query, category);
            })
            .listen(
              (cards) {
                if (isClosed) return;
                emit(
                  state.copyWith(
                    discountCards: cards,
                    status: const HomeDataSuccess(),
                  ),
                );
              },
              onError: (error) {
                if (isClosed) return;
                emit(state.copyWith(status: HomeDataError(error.toString())));
              },
            );
  }

  void changeSearchQuery(String newQuery) {
    emit(state.copyWith(searchQuery: newQuery));
  }

  void changeSelectedCategory(CardCategory? selectedCategory) {
    emit(state.copyWith(selectedCategory: selectedCategory));
  }

  @override
  Future<void> close() {
    _discountCardsSubscription?.cancel();
    return super.close();
  }
}
