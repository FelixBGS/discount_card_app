import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:discount_card_app/ui/home/state/home_action.dart';
import 'package:discount_card_app/ui/store/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

Stream<dynamic> homeEpic(
  Stream<dynamic> actions,
  EpicStore<AppState> store,
  DiscountCardRepository repository,
) {
  final queryChanges = actions.whereType<QueryChanged>().debounceTime(
    const Duration(milliseconds: 300),
  );

  final categoryChanges = actions.whereType<CategoryChanged>();
  final starts = actions.whereType<HomeStarted>();

  return Rx.merge([queryChanges, categoryChanges, starts]).switchMap((action) {
    final homeState = store.state.homeState;
    final query = homeState.searchQuery;
    final category = homeState.selectedCategory;

    return repository
        .watchCardsByFilters(query, category)
        .map<HomeAction>((cards) {
          return CardsReceived(cards: cards);
        })
        .onErrorReturnWith(
          (error, stackTrace) => CardsFailed(message: error.toString()),
        );
  });
}
