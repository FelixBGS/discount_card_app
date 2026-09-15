import 'package:discount_card_app/data/mappers/barcode_format_mapper.dart';
import 'package:discount_card_app/data/mappers/card_category_type_mapper.dart';
import 'package:discount_card_app/data/mappers/card_color_mapper.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';

import '../../domain/models/logo_source.dart';
import '../models/api/discount_card_api.dart';

abstract final class DiscountCardMapper {
  static DiscountCard fromApi(DiscountCardApi value) => DiscountCard(
    id: value.id,
    shopName: value.shopName,
    category: CardCategoryTypeMapper.fromApi(value.category),
    color: CardColorMapper.fromApi(value.color),
    barcode: value.barcode,
    barcodeFormat: BarcodeFormatMapper.fromApi(value.barcodeFormat),
    logo: LogoSource.parse(value.logoUrl),
    description: value.description,
  );

  static DiscountCardApi toApi(DiscountCard value) => DiscountCardApi(
    id: value.id,
    shopName: value.shopName,
    category: CardCategoryTypeMapper.toApi(value.category),
    color: CardColorMapper.toApi(value.color),
    barcode: value.barcode,
    barcodeFormat: BarcodeFormatMapper.toApi(value.barcodeFormat),
    logoUrl: value.logo.toRawUrl(),
    description: value.description,
  );

  static DiscountCard fromJson(Map<String, dynamic> json) =>
      fromApi(DiscountCardApi.fromJson(json));

  static Map<String, dynamic> toJson(DiscountCard value) =>
      toApi(value).toJson();
}
