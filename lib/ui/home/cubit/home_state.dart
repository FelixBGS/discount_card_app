import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/ui/models/discount_card_ui.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

class HomeState extends Equatable {
  const HomeState({
    this.selectedCategory,
    this.searchQuery = "",
    this.discountCards = const [],
    this.status = const HomeDataInitial(),
  });

  final CardCategoryType? selectedCategory;
  final List<DiscountCardUi> discountCards;
  final String searchQuery;
  final HomeDataStatus status;

  HomeState copyWith({
    HomeDataStatus? status,
    ValueGetter<CardCategoryType?>? selectedCategory,
    String? searchQuery,
    List<DiscountCardUi>? discountCards,
  }) {
    return HomeState(
      status: status ?? this.status,
      selectedCategory: selectedCategory != null
          ? selectedCategory()
          : this.selectedCategory,
      searchQuery: searchQuery ?? this.searchQuery,
      discountCards: discountCards ?? this.discountCards,
    );
  }

  @override
  List<Object?> get props => [
    selectedCategory,
    searchQuery,
    discountCards,
    status,
  ];
}

sealed class HomeDataStatus extends Equatable {
  const HomeDataStatus();

  @override
  List<Object?> get props => [];
}

final class HomeDataInitial extends HomeDataStatus {
  const HomeDataInitial();
}

final class HomeDataSuccess extends HomeDataStatus {
  const HomeDataSuccess();
}

final class HomeDataError extends HomeDataStatus {
  final String message;
  const HomeDataError(this.message);

  @override
  List<Object?> get props => [message];
}
