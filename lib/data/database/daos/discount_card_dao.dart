import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:drift/drift.dart';

import '../drift_database.dart';
import '../tables/discount_card_scheme.dart';

part 'discount_card_dao.g.dart';

@DriftAccessor(tables: [DiscountCardScheme])
class DiscountCardDao extends DatabaseAccessor<AppDatabase>
    with _$DiscountCardDaoMixin {
  DiscountCardDao(super.db);

  Stream<List<DiscountCardEntity>> watchCardsByFilters(
    String shopNameQuery,
    CardCategory? category,
  ) {
    final query = select(discountCardScheme);

    if (category != null) {
      query.where((tbl) => tbl.category.equalsValue(category));
    }

    final normalizedQuery = shopNameQuery.trim().toLowerCase();
    if (normalizedQuery.isNotEmpty) {
      query.where((tbl) => tbl.shopNameSearch.like("%$normalizedQuery%"));
    }

    return query.watch();
  }

  Future<DiscountCardEntity?> getCardById(String id) {
    return (select(
      discountCardScheme,
    )..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  }

  Future<void> insertCard(DiscountCardSchemeCompanion entity) =>
      into(discountCardScheme).insert(entity);

  Future<void> upsertCard(DiscountCardSchemeCompanion entity) =>
      into(discountCardScheme).insertOnConflictUpdate(entity);

  Future<void> updateCard(DiscountCardEntity entity) =>
      update(discountCardScheme).replace(entity);

  Future<void> deleteCardById(String id) {
    return (delete(discountCardScheme)..where((tbl) => tbl.id.equals(id))).go();
  }
}
