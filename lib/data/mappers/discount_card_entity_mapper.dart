import 'package:discount_card_app/data/database/drift_database.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:drift/drift.dart';

extension DiscountCardEntityMapper on DiscountCardEntity {
  DiscountCard toDomain() => DiscountCard(
    id: id,
    shopName: shopName,
    category: category,
    color: color,
    barcode: barcode,
    barcodeFormat: barcodeFormat,
    logo: LogoSource.parse(logoUrl),
    description: description,
  );
}

extension DiscountCardMapper on DiscountCard {
  DiscountCardSchemeCompanion toCompanion() => DiscountCardSchemeCompanion(
    id: Value(id),
    shopName: Value(shopName),
    shopNameSearch: Value(shopName.toLowerCase()),
    category: Value(category),
    color: Value(color),
    barcode: Value(barcode),
    barcodeFormat: Value(barcodeFormat),
    logoUrl: Value(logo.toRawUrl()),
    description: Value(description),
  );
}
