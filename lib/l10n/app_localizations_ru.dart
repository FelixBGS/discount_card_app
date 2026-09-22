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
  String get editCardTitle => 'Редактирование карты';

  @override
  String get createCardTitle => 'Создание карты';

  @override
  String get cardColor => 'Цвет карты';

  @override
  String get save => 'Сохранить';

  @override
  String get deleteCard => 'Удалить карту';

  @override
  String get cancel => 'Отмена';

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

  @override
  String get categoryTitle => 'Категория';

  @override
  String get iconAndShopNameTitle => 'Иконка и название';

  @override
  String get shopNameLabel => 'Название магазина';

  @override
  String get cardDescriptionLabel => 'Описание';

  @override
  String get barcodeTitle => 'Штрихкод';

  @override
  String get editBarcodeNumber => 'Редактировать номер штрихкода';

  @override
  String get barcodeEmptyPlaceholder => 'Номер штрихкода не указан';

  @override
  String get barcodeUnknownPlaceholder => 'Неизвестный тип штрихкода';

  @override
  String get barcodeInvalidPlaceholder => 'Некорректный номер штрихкода';

  @override
  String get editBarcodeNumberBottomSheet => 'Редактирование штрихкода';

  @override
  String get instructionEditBarcodeNumberBottomSheet =>
      'Введите числовой номер штрихкода. При необходимости выберите формат';

  @override
  String get barcodeNumberTitle => 'Номер штрихкода';

  @override
  String get barcodeFormatTitle => 'Формат';

  @override
  String get pickFromGallery => 'Выбрать из галереи';

  @override
  String get popularLogos => 'Популярные логотипы';

  @override
  String get editIconTitle => 'Изменить иконку';
}
