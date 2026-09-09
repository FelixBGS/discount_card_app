import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/ui/home/cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  void changeQuery(String newQuery) => emit(
    HomeState(selectedFilter: state.selectedFilter, searchQuery: newQuery),
  );

  void changeSelectedFilter(CardCategoryType? selectedFilter) => emit(
    HomeState(selectedFilter: selectedFilter, searchQuery: state.searchQuery),
  );
}
