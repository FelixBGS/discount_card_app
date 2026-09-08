import 'package:discount_card_app/data/mappers/barcode_format_mapper.dart';
import 'package:discount_card_app/data/mappers/card_category_type_mapper.dart';
import 'package:discount_card_app/data/mappers/card_color_mapper.dart';
import 'package:discount_card_app/data/models/discount_card_dto.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';

abstract final class DiscountCardMapper {
  static DiscountCard fromApi(DiscountCardDto value) => DiscountCard(
    id: value.id,
    shopName: value.shopName,
    category: CardCategoryTypeMapper.fromApi(value.category),
    color: CardColorMapper.fromApi(value.color),
    barcode: value.barcode,
    barcodeFormat: BarcodeFormatMapper.fromApi(value.barcodeFormat),
    logoUrl: value.logoUrl,
    description: value.description,
  );

  static DiscountCardDto toApi(DiscountCard value) => DiscountCardDto(
    id: value.id,
    shopName: value.shopName,
    category: CardCategoryTypeMapper.toApi(value.category),
    color: CardColorMapper.toApi(value.color),
    barcode: value.barcode,
    barcodeFormat: BarcodeFormatMapper.toApi(value.barcodeFormat),
    logoUrl: value.logoUrl,
    description: value.description,
  );

  static DiscountCard fromJson(Map<String, dynamic> json) =>
      fromApi(DiscountCardDto.fromJson(json));

  static Map<String, dynamic> toJson(DiscountCard value) =>
      toApi(value).toJson();
}
