import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';

abstract interface class DiscountCardRepository {
  Future<List<DiscountCard>> getCards();
  Future<List<DiscountCard>> searchCardsByType(CardCategoryType? category);
  Future<void> saveCard(DiscountCard card);
}
