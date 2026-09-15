import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:equatable/equatable.dart';

import 'logo_source.dart';

class DiscountCard extends Equatable {
  const DiscountCard({
    required this.id,
    required this.shopName,
    required this.category,
    required this.color,
    required this.barcode,
    required this.barcodeFormat,
    required this.logo,
    this.description,
  });

  final String id;

  final String shopName;

  final CardCategoryType category;
  final CardColor color;
  final String barcode;
  final BarcodeFormat barcodeFormat;
  final LogoSource logo;
  final String? description;

  DiscountCard copyWith({
    String? id,
    String? name,
    CardCategoryType? category,
    CardColor? color,
    String? barcode,
    BarcodeFormat? barcodeFormat,
    LogoSource? logoUrl,
    String? description,
  }) {
    return DiscountCard(
      id: id ?? this.id,
      shopName: name ?? this.shopName,
      category: category ?? this.category,
      color: color ?? this.color,
      barcode: barcode ?? this.barcode,
      barcodeFormat: barcodeFormat ?? this.barcodeFormat,
      logo: logoUrl ?? this.logo,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => [
    id,
    shopName,
    category,
    color,
    barcode,
    barcodeFormat,
    logo,
    description,
  ];
}
