import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    log('Event: ${bloc.runtimeType} => $event', name: 'BLoC');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('Change: ${bloc.runtimeType} => $change', name: 'BLoC');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    log('Transition: ${bloc.runtimeType} => $transition', name: 'BLoC');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log(
      'Error: ${bloc.runtimeType} => $error',
      error: error,
      stackTrace: stackTrace,
      name: 'BLoC',
    );
    super.onError(bloc, error, stackTrace);
  }
}
