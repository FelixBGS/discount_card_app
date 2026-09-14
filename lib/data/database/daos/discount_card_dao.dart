import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:drift/drift.dart';

import '../drift_database.dart';
import '../tables/discount_card_scheme.dart';

part 'discount_card_dao.g.dart';

@DriftAccessor(tables: [DiscountCardScheme])
class DiscountCardDao extends DatabaseAccessor<AppDatabase>
    with _$DiscountCardDaoMixin {
  DiscountCardDao(super.db);

  Future<List<DiscountCardEntity>> getAllCards() =>
      select(discountCardScheme).get();

  Future<List<DiscountCardEntity>> getCardsByCategory(
    CardCategoryType category,
  ) {
    return (select(
      discountCardScheme,
    )..where((tbl) => tbl.category.equalsValue(category))).get();
  }

  Future<List<DiscountCardEntity>> getCardsByShopNameQuery(
    String shopNameQuery,
  ) {
    final shopNameQueryLower = shopNameQuery.toLowerCase();
    return (select(
      discountCardScheme,
    )..where((tbl) => tbl.shopNameSearch.like('%$shopNameQueryLower%'))).get();
  }

  Future<List<DiscountCardEntity>> getCardsByCategoryAndShopNameQuery(
    String shopNameQuery,
    CardCategoryType category,
  ) {
    final shopNameQueryLower = shopNameQuery.toLowerCase();
    return (select(discountCardScheme)..where(
          (tbl) =>
              tbl.category.equalsValue(category) &
              tbl.shopNameSearch.like('%$shopNameQueryLower%'),
        ))
        .get();
  }

  Future<void> insertCard(DiscountCardSchemeCompanion entity) =>
      into(discountCardScheme).insert(entity);

  Future<void> updateCard(DiscountCardEntity entity) =>
      update(discountCardScheme).replace(entity);

  Future<void> deleteCardById(String id) {
    return (delete(discountCardScheme)..where((tbl) => tbl.id.equals(id))).go();
  }
}
