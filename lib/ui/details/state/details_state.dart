import 'package:discount_card_app/domain/models/discount_card.dart';

enum DetailsStatus { loading, ready, missing, error }

class DetailsState {
  const DetailsState({this.status = DetailsStatus.loading, this.card});

  final DetailsStatus status;
  final DiscountCard? card;
}
