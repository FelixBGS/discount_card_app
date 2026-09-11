// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discount_card_dao.dart';

// ignore_for_file: type=lint
mixin _$DiscountCardDaoMixin on DatabaseAccessor<AppDatabase> {
  $DiscountCardSchemeTable get discountCardScheme =>
      attachedDatabase.discountCardScheme;
  DiscountCardDaoManager get managers => DiscountCardDaoManager(this);
}

class DiscountCardDaoManager {
  final _$DiscountCardDaoMixin _db;
  DiscountCardDaoManager(this._db);
  $$DiscountCardSchemeTableTableManager get discountCardScheme =>
      $$DiscountCardSchemeTableTableManager(
        _db.attachedDatabase,
        _db.discountCardScheme,
      );
}
