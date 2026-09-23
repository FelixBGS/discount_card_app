import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/l10n/app_localizations.dart';
import 'package:discount_card_app/ui/details/widgets/details_screen.dart';
import 'package:discount_card_app/ui/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('details shows card data and only the edit action', (
    tester,
  ) async {
    var edited = false;
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('ru'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: DetailsContent(
          card: const DiscountCard(
            id: '1',
            shopName: 'Пятёрочка',
            category: CardCategoryType.supermarket,
            color: CardColor.red,
            barcode: '4601234567893',
            barcodeFormat: BarcodeFormat.ean13,
            logo: LogoSource.empty(),
            description: 'Скидки и акции',
          ),
          onEdit: () => edited = true,
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Пятёрочка'), findsOneWidget);
    expect(find.text('Супермаркеты'), findsWidgets);
    expect(find.text('Категория'), findsOneWidget);
    expect(find.text('Цвет карты'), findsOneWidget);
    expect(find.text('Описание'), findsOneWidget);
    expect(find.text('Скидки и акции'), findsOneWidget);
    expect(find.text('4601234567893'), findsOneWidget);
    expect(find.text('Редактировать'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_forward_ios), findsNothing);
    expect(find.byIcon(Icons.delete_outline), findsNothing);

    await tester.tap(find.text('Редактировать'));
    expect(edited, isTrue);
  });

  testWidgets('details hides the description field when it is empty', (
    tester,
  ) async {
    await tester.pumpWidget(
      MaterialApp(
        theme: AppTheme.light,
        locale: const Locale('ru'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: const DetailsContent(
          card: DiscountCard(
            id: '1',
            shopName: 'Пятёрочка',
            category: CardCategoryType.supermarket,
            color: CardColor.red,
            barcode: '4601234567893',
            barcodeFormat: BarcodeFormat.ean13,
            logo: LogoSource.empty(),
          ),
          onEdit: _noop,
        ),
      ),
    );
    await tester.pump();

    expect(find.text('Описание'), findsNothing);
  });
}

void _noop() {}
