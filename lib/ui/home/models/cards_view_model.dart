import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/discount_card.dart';
import '../state/home_state.dart';

part 'cards_view_model.freezed.dart';

@freezed
class CardsViewModel with _$CardsViewModel {
  final HomeDataStatus status;
  final List<DiscountCard> discountCards;

  const CardsViewModel({required this.status, required this.discountCards});
}
