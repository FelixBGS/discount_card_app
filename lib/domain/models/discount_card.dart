import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/card_color.dart';

class DiscountCard {
  const DiscountCard({
    required this.id,
    required this.shopName,
    required this.category,
    required this.color,
    required this.barcode,
    required this.barcodeFormat,
    this.logoUrl,
    this.description,
  });

  final String id;

  final String shopName;

  final CardCategoryType category;
  final CardColor color;
  final String barcode;
  final BarcodeFormat barcodeFormat;
  final String? logoUrl;
  final String? description;

  DiscountCard copyWith({
    String? id,
    String? name,
    CardCategoryType? category,
    CardColor? color,
    String? barcode,
    BarcodeFormat? barcodeFormat,
    String? logoUrl,
    String? description,
  }) {
    return DiscountCard(
      id: id ?? this.id,
      shopName: name ?? this.shopName,
      category: category ?? this.category,
      color: color ?? this.color,
      barcode: barcode ?? this.barcode,
      barcodeFormat: barcodeFormat ?? this.barcodeFormat,
      logoUrl: logoUrl ?? this.logoUrl,
      description: description ?? this.description,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is DiscountCard &&
            id == other.id &&
            shopName == other.shopName &&
            category == other.category &&
            color == other.color &&
            barcode == other.barcode &&
            barcodeFormat == other.barcodeFormat &&
            logoUrl == other.logoUrl &&
            description == other.description;
  }

  @override
  int get hashCode => Object.hash(
    id,
    shopName,
    category,
    color,
    barcode,
    barcodeFormat,
    logoUrl,
    description,
  );
}
