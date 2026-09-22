import 'package:discount_card_app/data/database/daos/discount_card_dao.dart';
import 'package:discount_card_app/data/mappers/discount_card_entity_mapper.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';

final class DiscountCardRepositoryImpl implements DiscountCardRepository {
  final DiscountCardDao _dao;

  DiscountCardRepositoryImpl(this._dao);

  @override
  Future<DiscountCard?> getCardById(String id) async {
    final entity = await _dao.getCardById(id);
    return entity?.toDomain();
  }

  @override
  Future<void> saveCard(DiscountCard card) async {
    await _dao.upsertCard(card.toCompanion());
  }

  @override
  Future<void> deleteCard(String id) async {
    await _dao.deleteCardById(id);
  }

  @override
  Stream<List<DiscountCard>> watchCardsByFilters(
    String shopNameQuery,
    CardCategoryType? category,
  ) {
    return _dao
        .watchCardsByFilters(shopNameQuery, category)
        .map((entities) => entities.map((e) => e.toDomain()).toList());
  }
}
