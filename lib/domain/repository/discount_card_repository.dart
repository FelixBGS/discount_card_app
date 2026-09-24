import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';

abstract interface class DiscountCardRepository {
  Stream<List<DiscountCard>> watchCardsByFilters(
    String shopNameQuery,
    CardCategory? category,
  );

  Future<DiscountCard?> getCardById(String id);

  Future<void> saveCard(DiscountCard card);

  Future<void> deleteCard(String id);
}
