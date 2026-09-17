import 'package:discount_card_app/core/di/injection.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:discount_card_app/l10n/app_localizations.dart';
import 'package:discount_card_app/ui/home/state/home_action.dart';
import 'package:discount_card_app/ui/router/app_router.dart';
import 'package:discount_card_app/ui/shared/themes/app_theme.dart';
import 'package:discount_card_app/ui/store/app_state.dart';
import 'package:discount_card_app/ui/store/app_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  final store = configureStore(getIt<DiscountCardRepository>())
    ..dispatch(const HomeStarted());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp.router(
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: AppTheme.light,
        routerConfig: goRouter,
      ),
    );
  }
}
