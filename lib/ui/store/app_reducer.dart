import 'package:discount_card_app/ui/home/state/home_action.dart';
import 'package:discount_card_app/ui/home/state/home_reducer.dart';
import 'package:redux/redux.dart';

import '../home/state/home_state.dart';
import 'app_state.dart';

AppState appReducer(AppState oldState, dynamic action) {
  return AppState(
    homeState: TypedReducer<HomeState, HomeAction>(homeReducer)(
      oldState.homeState,
      action,
    ),
  );
}
