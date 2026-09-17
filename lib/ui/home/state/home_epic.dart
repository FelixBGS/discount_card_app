import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:discount_card_app/ui/home/state/home_action.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

typedef _Filters = ({String query, CardCategoryType? category});

Stream<dynamic> homeEpic<S>(
  Stream<dynamic> actions,
  EpicStore<S> _,
  DiscountCardRepository repository,
) {
  final queries = actions
      .whereType<QueryChanged>()
      .map((action) => action.newQuery)
      .debounceTime(const Duration(milliseconds: 300))
      .distinct()
      .startWith('');

  final categories = actions
      .whereType<CategoryChanged>()
      .map((action) => action.category)
      .distinct()
      .startWith(null);

  final filters = Rx.combineLatest2(
    queries,
    categories,
    (String query, CardCategoryType? category) =>
        (query: query, category: category),
  );

  return filters.switchMap(_loadCards(repository));
}

Stream<HomeAction> Function(_Filters) _loadCards(
  DiscountCardRepository repository,
) {
  return (filters) {
    return Stream.fromFuture(
          repository.getCards(filters.query, filters.category),
        )
        .map<HomeAction>((cards) => CardsReceived(cards: cards))
        .onErrorReturnWith((_, _) => const CardsFailed());
  };
}
