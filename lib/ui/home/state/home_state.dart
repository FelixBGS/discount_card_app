import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState({
    this.selectedCategory,
    this.searchQuery = "",
    this.discountCards = const [],
    this.status = const HomeDataInitial(),
  });

  final CardCategoryType? selectedCategory;
  final List<DiscountCard> discountCards;
  final String searchQuery;
  final HomeDataStatus status;
}

@freezed
sealed class HomeDataStatus with _$HomeDataStatus {
  const factory HomeDataStatus.initial() = HomeDataInitial;

  const factory HomeDataStatus.success() = HomeDataSuccess;

  const factory HomeDataStatus.error(String message) = HomeDataError;
}
