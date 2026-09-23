import 'dart:async';

import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:discount_card_app/ui/details/state/details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._repository, this.cardId) : super(const DetailsState()) {
    unawaited(load());
  }

  final DiscountCardRepository _repository;
  final String cardId;

  Future<void> load() async {
    final previous = state.card;
    if (previous == null) {
      emit(const DetailsState());
    }

    try {
      final card = await _repository.getCardById(cardId);
      if (isClosed) return;
      if (card == null) {
        emit(
          DetailsState(
            status: previous == null
                ? DetailsStatus.error
                : DetailsStatus.missing,
          ),
        );
        return;
      }
      emit(DetailsState(status: DetailsStatus.ready, card: card));
    } on Exception {
      if (isClosed) return;
      if (previous != null) return;
      emit(const DetailsState(status: DetailsStatus.error));
    }
  }
}
