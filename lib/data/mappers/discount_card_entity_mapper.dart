import 'package:drift/drift.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/data/database/drift_database.dart';

extension DiscountCardEntityMapper on DiscountCardEntity {
  DiscountCard toDomain() => DiscountCard(
    id: id,
    shopName: shopName,
    category: category,
    color: color,
    barcode: barcode,
    barcodeFormat: barcodeFormat,
    logoUrl: logoUrl,
    description: description,
  );
}

extension DiscountCardMapper on DiscountCard {
  DiscountCardSchemeCompanion toCompanion() => DiscountCardSchemeCompanion(
    id: Value(id),
    shopName: Value(shopName),
    category: Value(category),
    color: Value(color),
    barcode: Value(barcode),
    barcodeFormat: Value(barcodeFormat),
    logoUrl: Value(logoUrl),
    description: Value(description),
  );
}
