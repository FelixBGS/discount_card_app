import 'package:discount_card_app/ui/home/state/home_action.dart';

import 'home_state.dart';

HomeState homeReducer(HomeState currentState, HomeAction action) =>
    switch (action) {
      HomeStarted() => currentState,
      QueryChanged() => currentState,
      CategoryChanged() => currentState.copyWith(
        selectedCategory: action.category,
      ),
      CardsReceived() => currentState.copyWith(
        status: const HomeDataSuccess(),
        discountCards: action.cards,
      ),
      CardsFailed() => currentState.copyWith(status: const HomeDataError()),
    };
