import 'package:discount_card_app/data/database/converters/barcode_format_converter.dart';
import 'package:discount_card_app/data/database/converters/card_category_converter.dart';
import 'package:drift/drift.dart';

import '../converters/card_color_converter.dart';

@DataClassName('DiscountCardEntity')
class DiscountCardScheme extends Table {
  TextColumn get id => text()();
  TextColumn get shopName => text()();
  TextColumn get category => text().map(const CardCategoryConverter())();
  TextColumn get color => text().map(const CardColorConverter())();
  TextColumn get barcode => text()();
  TextColumn get barcodeFormat => text().map(const BarcodeFormatConverter())();
  TextColumn get logoUrl => text().nullable()();
  TextColumn get description => text().nullable()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}