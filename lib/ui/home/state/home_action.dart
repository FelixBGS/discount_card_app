import 'package:discount_card_app/domain/models/card_category_type.dart';

import '../../../domain/models/discount_card.dart';

sealed class HomeAction {
  const HomeAction();
}

final class HomeStarted extends HomeAction {
  const HomeStarted();
}

final class QueryChanged extends HomeAction {
  final String newQuery;

  const QueryChanged({required this.newQuery});
}

final class CategoryChanged extends HomeAction {
  final CardCategoryType? category;

  const CategoryChanged(this.category);
}

final class CardsReceived extends HomeAction {
  final List<DiscountCard> cards;

  const CardsReceived({required this.cards});
}

final class CardsFailed extends HomeAction {
  final String message;

  const CardsFailed({required this.message});
}
