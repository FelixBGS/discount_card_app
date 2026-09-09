import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';

final class DiscountCardRepositoryImpl implements DiscountCardRepository {
  @override
  Future<List<DiscountCard>> getCards() async {
    return [];
  }

  @override
  Future<void> saveCard(DiscountCard card) async {
    return;
  }

  @override
  Future<List<DiscountCard>> searchCardsByType(
    CardCategoryType? category,
  ) async {
    if (category == null) {
      return [
        DiscountCard(
          id: "1",
          shopName: "Пятерочка",
          category: CardCategoryType.supermarket,
          color: CardColor.green,
          barcode: "2349521",
          barcodeFormat: BarcodeFormat.ean8,
          logoUrl: "https://trace-logos.ru/assets/logos/svgs/pyaterochka.svg",
        ),
        DiscountCard(
          id: "2",
          shopName: "Чижик",
          category: CardCategoryType.supermarket,
          color: CardColor.yellow,
          barcode: "2142141",
          barcodeFormat: BarcodeFormat.ean8,
          logoUrl: "https://trace-logos.ru/assets/logos/svgs/chizhik.svg",
        ),
        DiscountCard(
          id: "3",
          shopName: "McDonalds",
          category: CardCategoryType.cafeAndRestaurant,
          color: CardColor.red,
          barcode: "14120102",
          barcodeFormat: BarcodeFormat.ean8,
          logoUrl: "https://trace-logos.ru/assets/logos/svgs/mcdonalds.svg",
        ),
      ];
    } else {
      return [
        DiscountCard(
          id: "3",
          shopName: "McDonalds",
          category: CardCategoryType.cafeAndRestaurant,
          color: CardColor.red,
          barcode: "14120102",
          barcodeFormat: BarcodeFormat.ean8,
          logoUrl: "https://trace-logos.ru/assets/logos/svgs/mcdonalds.svg",
        ),
      ];
    }
  }
}
