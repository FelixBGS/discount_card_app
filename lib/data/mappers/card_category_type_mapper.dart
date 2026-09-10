import 'package:discount_card_app/domain/models/card_category_type.dart';
import '../models/api/card_category_type_api.dart';

abstract final class CardCategoryTypeMapper {
  static CardCategoryType fromApi(String value) => switch (value) {
    CardCategoryTypeApi.cafeAndRestaurant => CardCategoryType.cafeAndRestaurant,
    CardCategoryTypeApi.clothing => CardCategoryType.clothing,
    CardCategoryTypeApi.electronics => CardCategoryType.electronics,
    CardCategoryTypeApi.entertainment => CardCategoryType.entertainment,
    CardCategoryTypeApi.householdAppliance =>
      CardCategoryType.householdAppliance,
    CardCategoryTypeApi.pharmacy => CardCategoryType.pharmacy,
    CardCategoryTypeApi.supermarket => CardCategoryType.supermarket,
    _ => CardCategoryType.unknown,
  };

  static String toApi(CardCategoryType value) => switch (value) {
    CardCategoryType.cafeAndRestaurant => CardCategoryTypeApi.cafeAndRestaurant,
    CardCategoryType.clothing => CardCategoryTypeApi.clothing,
    CardCategoryType.electronics => CardCategoryTypeApi.electronics,
    CardCategoryType.entertainment => CardCategoryTypeApi.entertainment,
    CardCategoryType.householdAppliance =>
      CardCategoryTypeApi.householdAppliance,
    CardCategoryType.pharmacy => CardCategoryTypeApi.pharmacy,
    CardCategoryType.supermarket => CardCategoryTypeApi.supermarket,
    CardCategoryType.unknown => CardCategoryTypeApi.unknown,
  };
}
