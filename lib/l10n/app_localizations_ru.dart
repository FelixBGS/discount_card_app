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

  @override
  String get supermarketCategory => 'Супермаркеты';

  @override
  String get clothingCategory => 'Одежда';

  @override
  String get cafeAndRestaurantsCategory => 'Кафе и рестораны';

  @override
  String get householdApplianceCategory => 'Бытовая техника';

  @override
  String get pharmacyCategory => 'Аптеки';

  @override
  String get entertainmentCategory => 'Развлечения';

  @override
  String get electronicsCategory => 'Электроника';

  @override
  String get unknownCategory => 'Другое';

  @override
  String get allFilter => 'Все';
}
