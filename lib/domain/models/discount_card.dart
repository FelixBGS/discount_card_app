import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'logo_source.dart';

part 'discount_card.freezed.dart';

@freezed
class DiscountCard with _$DiscountCard {
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

  final CardCategory category;
  final CardColor color;
  final String barcode;
  final BarcodeFormat barcodeFormat;
  final LogoSource logo;
  final String? description;
}
