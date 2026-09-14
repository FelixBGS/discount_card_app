import 'package:discount_card_app/data/database/daos/discount_card_dao.dart';
import 'package:discount_card_app/data/mappers/discount_card_entity_mapper.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';

final class DiscountCardRepositoryImpl implements DiscountCardRepository {
  final DiscountCardDao _dao;

  DiscountCardRepositoryImpl(this._dao);

  @override
  Future<void> saveCard(DiscountCard card) async {
    await _dao.insertCard(card.toCompanion());
  }

  @override
  Future<List<DiscountCard>> searchCardsByFilters(
    String shopNameQuery,
    CardCategoryType? category,
  ) async {
    final entities = category == null
        ? await _dao.getCardsByShopNameQuery(shopNameQuery)
        : await _dao.getCardsByCategoryAndShopNameQuery(
            shopNameQuery,
            category,
          );
    return entities.map((e) => e.toDomain()).toList();
  }
}
