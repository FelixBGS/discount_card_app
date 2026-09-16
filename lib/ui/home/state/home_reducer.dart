import 'package:discount_card_app/ui/home/state/home_action.dart';

import 'home_state.dart';

HomeState homeReducer(
  HomeState currentState,
  HomeAction action,
) => switch (action) {
  HomeStarted() => currentState.copyWith(status: HomeDataInitial()),

  QueryChanged() => currentState.copyWith(searchQuery: action.newQuery),

  CategoryChanged() => currentState.copyWith(selectedCategory: action.category),

  CardsReceived() => currentState.copyWith(
    status: HomeDataSuccess(),
    discountCards: action.cards,
  ),

  CardsFailed() => currentState.copyWith(status: HomeDataError(action.message)),
};
