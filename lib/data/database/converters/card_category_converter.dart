import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:drift/drift.dart';

class CardCategoryConverter extends TypeConverter<CardCategory, String> {
  const CardCategoryConverter();

  @override
  CardCategory fromSql(String fromDb) => CardCategory.fromId(fromDb);

  @override
  String toSql(CardCategory value) => value.id;
}
