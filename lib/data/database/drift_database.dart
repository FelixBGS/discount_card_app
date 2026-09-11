import 'package:discount_card_app/data/database/tables/discount_card_scheme.dart';
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/domain/models/barcode_format.dart';

import 'package:discount_card_app/data/database/converters/card_category_converter.dart';
import 'package:discount_card_app/data/database/converters/card_color_converter.dart';
import 'package:discount_card_app/data/database/converters/barcode_format_converter.dart';

import 'daos/discount_card_dao.dart';

part 'drift_database.g.dart';

const String _databaseName = 'discount_cards';

@DriftDatabase(
  tables: [DiscountCardScheme],
  daos: [DiscountCardDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
        
        // Вставляем моковые данные при первом создании базы
        await batch((batch) {
          batch.insertAll(discountCardScheme, [
            DiscountCardSchemeCompanion.insert(
              id: "1",
              shopName: "Пятерочка",
              category: CardCategoryType.supermarket,
              color: CardColor.green,
              barcode: "2349521",
              barcodeFormat: BarcodeFormat.ean8,
              logoUrl: const Value("https://trace-logos.ru/assets/logos/svgs/pyaterochka.svg"),
            ),
            DiscountCardSchemeCompanion.insert(
              id: "2",
              shopName: "Чижик",
              category: CardCategoryType.supermarket,
              color: CardColor.yellow,
              barcode: "2142141",
              barcodeFormat: BarcodeFormat.ean8,
              logoUrl: const Value("https://trace-logos.ru/assets/logos/svgs/chizhik.svg"),
            ),
            DiscountCardSchemeCompanion.insert(
              id: "3",
              shopName: "McDonalds",
              category: CardCategoryType.cafeAndRestaurant,
              color: CardColor.red,
              barcode: "14120102",
              barcodeFormat: BarcodeFormat.ean8,
              logoUrl: const Value("https://trace-logos.ru/assets/logos/svgs/mcdonalds.svg"),
            ),
          ]);
        });
      },
    );
  }

  static QueryExecutor _openConnection() => driftDatabase(
    name: _databaseName,
    native: const DriftNativeOptions(
      databaseDirectory: getApplicationSupportDirectory,
    ),
  );
}