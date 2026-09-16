import 'package:freezed_annotation/freezed_annotation.dart';

import '../home/state/home_state.dart';

part 'app_state.freezed.dart';

@freezed
final class AppState with _$AppState {
  final HomeState homeState;

  const AppState({this.homeState = const HomeState()});
}
