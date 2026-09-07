// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get myCardsTitle => 'Мои карты';

  @override
  String get catalogNavOption => 'Каталог';

  @override
  String get scannerNavOption => 'Сканер';

  @override
  String get settingsNavOption => 'Настройки';

  @override
  String get searchCardsHint => 'Поиск по названию или магазину';
}
