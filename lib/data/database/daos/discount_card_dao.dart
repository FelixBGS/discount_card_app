import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:drift/drift.dart';

import '../drift_database.dart';
import '../tables/discount_card_scheme.dart';

part 'discount_card_dao.g.dart';

@DriftAccessor(tables: [DiscountCardScheme])
class DiscountCardDao extends DatabaseAccessor<AppDatabase>
    with _$DiscountCardDaoMixin {
  DiscountCardDao(super.db);

  Future<List<DiscountCardEntity>> getCardsByFilters(
    String shopNameQuery,
    CardCategoryType? category,
  ) {
    final query = select(discountCardScheme);

    if (category != null) {
      query.where((tbl) => tbl.category.equalsValue(category));
    }

    final normalizedQuery = shopNameQuery.trim().toLowerCase();
    if (normalizedQuery.isNotEmpty) {
      query.where((tbl) => tbl.shopNameSearch.like("%$normalizedQuery%"));
    }

    return query.get();
  }

  Future<void> insertCard(DiscountCardSchemeCompanion entity) =>
      into(discountCardScheme).insert(entity);

  Future<void> updateCard(DiscountCardEntity entity) =>
      update(discountCardScheme).replace(entity);

  Future<void> deleteCardById(String id) {
    return (delete(discountCardScheme)..where((tbl) => tbl.id.equals(id))).go();
  }
}
