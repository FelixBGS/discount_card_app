import 'package:discount_card_app/domain/models/card_category_type.dart';
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
    return [];
  }
}
