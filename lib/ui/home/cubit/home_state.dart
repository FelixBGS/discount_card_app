import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/ui/models/discount_card_ui.dart';
import 'package:flutter/widgets.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({
    this.selectedFilter,
    this.searchQuery = "",
    this.discountCards = const [],
    this.isLoading = false,
  });

  final CardCategoryType? selectedFilter;
  final List<DiscountCardUi> discountCards;
  final String searchQuery;
  final bool isLoading;

  HomeState copyWith({
    ValueGetter<CardCategoryType?>? selectedFilter,
    List<DiscountCardUi>? discountCards,
    String? searchQuery,
    bool? isLoading,
  }) {
    return HomeState(
      selectedFilter: selectedFilter != null
          ? selectedFilter()
          : this.selectedFilter,
      discountCards: discountCards ?? this.discountCards,
      searchQuery: searchQuery ?? this.searchQuery,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [selectedFilter, searchQuery, discountCards, isLoading];
}
