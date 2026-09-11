import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:discount_card_app/data/database/daos/discount_card_dao.dart';
import 'package:discount_card_app/data/mappers/discount_card_entity_mapper.dart';

final class DiscountCardRepositoryImpl implements DiscountCardRepository {
  final DiscountCardDao _dao;

  DiscountCardRepositoryImpl(this._dao);

  @override
  Future<List<DiscountCard>> getCards() async {
    final entities = await _dao.getAllCards();
    return entities.map((e) => e.toDomain()).toList();
  }

  @override
  Future<void> saveCard(DiscountCard card) async {
    await _dao.insertCard(card.toCompanion());
  }

  @override
  Future<List<DiscountCard>> searchCardsByType(CardCategoryType? category) async {
    final entities = category == null
        ? await _dao.getAllCards()
        : await _dao.getCardsByCategory(category);
    return entities.map((e) => e.toDomain()).toList();
  }
}
