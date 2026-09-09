import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  const HomeState({this.selectedFilter, this.searchQuery = ""});

  final CardCategoryType? selectedFilter;
  final String searchQuery;

  @override
  List<Object?> get props => [selectedFilter, searchQuery];
}
