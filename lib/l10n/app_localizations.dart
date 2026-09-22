import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ru')];

  /// Заглавия для экрана каталога
  ///
  /// In ru, this message translates to:
  /// **'Мои карты'**
  String get myCardsTitle;

  /// No description provided for @editCardTitle.
  ///
  /// In ru, this message translates to:
  /// **'Редактирование карты'**
  String get editCardTitle;

  /// No description provided for @createCardTitle.
  ///
  /// In ru, this message translates to:
  /// **'Создание карты'**
  String get createCardTitle;

  /// No description provided for @cardColor.
  ///
  /// In ru, this message translates to:
  /// **'Цвет карты'**
  String get cardColor;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранить'**
  String get save;

  /// No description provided for @deleteCard.
  ///
  /// In ru, this message translates to:
  /// **'Удалить карту'**
  String get deleteCard;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// Название раздела в навигационной нижней панели
  ///
  /// In ru, this message translates to:
  /// **'Каталог'**
  String get catalogNavOption;

  /// Название раздела в навигационной нижней панели
  ///
  /// In ru, this message translates to:
  /// **'Сканер'**
  String get scannerNavOption;

  /// Название раздела в навигационной нижней панели
  ///
  /// In ru, this message translates to:
  /// **'Настройки'**
  String get settingsNavOption;

  /// Подсказка по вводу для поисковой строки дисконтных карт
  ///
  /// In ru, this message translates to:
  /// **'Поиск по названию или магазину'**
  String get searchCardsHint;

  /// Название категории дисконтных карт
  ///
  /// In ru, this message translates to:
  /// **'Супермаркеты'**
  String get supermarketCategory;

  /// Название категории дисконтных карт
  ///
  /// In ru, this message translates to:
  /// **'Одежда'**
  String get clothingCategory;

  /// Название категории дисконтных карт
  ///
  /// In ru, this message translates to:
  /// **'Кафе и рестораны'**
  String get cafeAndRestaurantsCategory;

  /// Название категории дисконтных карт
  ///
  /// In ru, this message translates to:
  /// **'Бытовая техника'**
  String get householdApplianceCategory;

  /// Название категории дисконтных карт
  ///
  /// In ru, this message translates to:
  /// **'Аптеки'**
  String get pharmacyCategory;

  /// Название категории дисконтных карт
  ///
  /// In ru, this message translates to:
  /// **'Развлечения'**
  String get entertainmentCategory;

  /// Название категории дисконтных карт
  ///
  /// In ru, this message translates to:
  /// **'Электроника'**
  String get electronicsCategory;

  /// Подпись категории, если значение с API не распознано
  ///
  /// In ru, this message translates to:
  /// **'Другое'**
  String get unknownCategory;

  /// Подпись фильтра для отображения всех категорий
  ///
  /// In ru, this message translates to:
  /// **'Все'**
  String get allFilter;

  /// No description provided for @categoryTitle.
  ///
  /// In ru, this message translates to:
  /// **'Категория'**
  String get categoryTitle;

  /// No description provided for @iconAndShopNameTitle.
  ///
  /// In ru, this message translates to:
  /// **'Иконка и название'**
  String get iconAndShopNameTitle;

  /// No description provided for @shopNameLabel.
  ///
  /// In ru, this message translates to:
  /// **'Название магазина'**
  String get shopNameLabel;

  /// No description provided for @cardDescriptionLabel.
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get cardDescriptionLabel;

  /// Заголовок панели штрихкода
  ///
  /// In ru, this message translates to:
  /// **'Штрихкод'**
  String get barcodeTitle;

  /// Подпись кнопки перехода к редактированию номера штрихкода
  ///
  /// In ru, this message translates to:
  /// **'Редактировать номер штрихкода'**
  String get editBarcodeNumber;

  /// Плейсхолдер, если номер штрихкода пустой
  ///
  /// In ru, this message translates to:
  /// **'Номер штрихкода не указан'**
  String get barcodeEmptyPlaceholder;

  /// Плейсхолдер, если формат штрихкода неизвестен
  ///
  /// In ru, this message translates to:
  /// **'Неизвестный тип штрихкода'**
  String get barcodeUnknownPlaceholder;

  /// Плейсхолдер, если номер не подходит выбранному формату
  ///
  /// In ru, this message translates to:
  /// **'Некорректный номер штрихкода'**
  String get barcodeInvalidPlaceholder;

  /// No description provided for @editBarcodeNumberBottomSheet.
  ///
  /// In ru, this message translates to:
  /// **'Редактирование штрихкода'**
  String get editBarcodeNumberBottomSheet;

  /// No description provided for @instructionEditBarcodeNumberBottomSheet.
  ///
  /// In ru, this message translates to:
  /// **'Введите числовой номер штрихкода. При необходимости выберите формат'**
  String get instructionEditBarcodeNumberBottomSheet;

  /// No description provided for @barcodeNumberTitle.
  ///
  /// In ru, this message translates to:
  /// **'Номер штрихкода'**
  String get barcodeNumberTitle;

  /// No description provided for @barcodeFormatTitle.
  ///
  /// In ru, this message translates to:
  /// **'Формат'**
  String get barcodeFormatTitle;

  /// No description provided for @pickFromGallery.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать из галереи'**
  String get pickFromGallery;

  /// No description provided for @popularLogos.
  ///
  /// In ru, this message translates to:
  /// **'Популярные логотипы'**
  String get popularLogos;

  /// No description provided for @editIconTitle.
  ///
  /// In ru, this message translates to:
  /// **'Изменить иконку'**
  String get editIconTitle;

  /// Заголовок экрана фильтрации по категориям
  ///
  /// In ru, this message translates to:
  /// **'Фильтры'**
  String get filtersTitle;

  /// Заголовок списка категорий на экране фильтров
  ///
  /// In ru, this message translates to:
  /// **'Категории'**
  String get categoriesTitle;

  /// Кнопка применения выбранной категории
  ///
  /// In ru, this message translates to:
  /// **'Применить'**
  String get apply;

  /// Ошибка сохранения карты без названия магазина
  ///
  /// In ru, this message translates to:
  /// **'Укажите название магазина'**
  String get shopNameRequiredError;

  /// Ошибка сохранения карты с пустым или некорректным штрихкодом
  ///
  /// In ru, this message translates to:
  /// **'Укажите корректный штрихкод'**
  String get barcodeInvalidError;

  /// Кнопка повторной загрузки карты в редакторе
  ///
  /// In ru, this message translates to:
  /// **'Повторить'**
  String get retry;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
