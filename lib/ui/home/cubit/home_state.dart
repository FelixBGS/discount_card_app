import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    this.selectedFilter,
    this.searchQuery = "",
    this.discountCards = const [],
  });

  final CardCategoryType? selectedFilter;
  final List<DiscountCard> discountCards;
  final String searchQuery;

  HomeState copyWith({
    ValueGetter<CardCategoryType?>? selectedFilter,
    List<DiscountCard>? discountCards,
    String? searchQuery,
  }) {
    return HomeState(
      selectedFilter: selectedFilter != null
          ? selectedFilter()
          : this.selectedFilter,
      discountCards: discountCards ?? this.discountCards,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object?> get props => [selectedFilter, searchQuery, discountCards];
}
