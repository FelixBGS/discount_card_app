import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_filters.freezed.dart';

@freezed
class HomeFilters with _$HomeFilters {
  const HomeFilters({this.searchQuery = "", this.selectedCategory});

  final String searchQuery;
  final CardCategoryType? selectedCategory;
}
