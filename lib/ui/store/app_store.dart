import 'package:discount_card_app/ui/store/app_reducer.dart';
import 'package:discount_card_app/ui/store/app_state.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

import '../../domain/repository/discount_card_repository.dart';
import '../home/state/home_epic.dart';

Store<AppState> configureStore(DiscountCardRepository repository) {
  final epicMiddleware = EpicMiddleware<AppState>(
    combineEpics([(actions, store) => homeEpic(actions, store, repository)]),
  );
  return Store<AppState>(
    appReducer,
    initialState: const AppState(),
    middleware: [epicMiddleware.call],
  );
}
