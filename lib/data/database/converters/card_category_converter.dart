import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:drift/drift.dart';

class CardCategoryConverter extends TypeConverter<CardCategoryType, String> {
  const CardCategoryConverter();

  @override
  CardCategoryType fromSql(String fromDb) => switch (fromDb) {
    "SUPERMARKET" => CardCategoryType.supermarket,
    "CLOTHING" => CardCategoryType.clothing,
    "CAFE_AND_RESTAURANT" => CardCategoryType.cafeAndRestaurant,
    "PHARMACY" => CardCategoryType.pharmacy,
    "ELECTRONICS" => CardCategoryType.electronics,
    "HOUSEHOLD_APPLIANCE" => CardCategoryType.householdAppliance,
    "ENTERTAINMENT" => CardCategoryType.entertainment,
    _ => CardCategoryType.unknown,
  };

  @override
  String toSql(CardCategoryType value) => switch (value) {
    CardCategoryType.supermarket => "SUPERMARKET",
    CardCategoryType.clothing => "CLOTHING",
    CardCategoryType.cafeAndRestaurant => "CAFE_AND_RESTAURANT",
    CardCategoryType.pharmacy => "PHARMACY",
    CardCategoryType.electronics => "ELECTRONICS",
    CardCategoryType.householdAppliance => "HOUSEHOLD_APPLIANCE",
    CardCategoryType.entertainment => "ENTERTAINMENT",
    CardCategoryType.unknown => "UNKNOWN",
  };

}