import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/domain/repository/discount_card_repository.dart';
import 'package:discount_card_app/ui/editor/state/editor_args.dart';
import 'package:discount_card_app/ui/editor/state/editor_state.dart';
import 'package:discount_card_app/ui/models/barcode_format_codec.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/models/card_color.dart';

class EditorCubit extends Cubit<EditorState> {
  EditorCubit(EditorArgs args, this._repository) : super(_initialState(args)) {
    if (args case FromDetails(:final cardId)) {
      unawaited(_loadCard(cardId));
    }
  }

  final DiscountCardRepository _repository;

  static EditorState _initialState(EditorArgs args) => switch (args) {
    Blank() => const EditorState(),
    FromCamera(:final barcodeNumber, :final barcodeFormat) => EditorState(
      barcodeNumber: barcodeNumber,
      barcodeFormat: barcodeFormat,
    ),
    FromDetails(:final cardId) => EditorState(
      status: EditorStatus.loading,
      cardId: cardId,
    ),
  };

  void retryLoad() {
    final cardId = state.cardId;
    if (cardId != null) {
      unawaited(_loadCard(cardId));
    }
  }

  Future<void> _loadCard(String cardId) async {
    emit(state.copyWith(status: EditorStatus.loading, cardId: cardId));

    try {
      final card = await _repository.getCardById(cardId);
      if (isClosed) return;
      if (card == null) {
        emit(state.copyWith(status: EditorStatus.error, cardId: cardId));
        return;
      }
      emit(
        EditorState(
          cardId: cardId,
          selectedLogo: card.logo,
          shopName: card.shopName,
          selectedCategory: card.category,
          selectedColor: card.color,
          barcodeNumber: card.barcode,
          barcodeFormat: card.barcodeFormat,
          description: card.description ?? "",
        ),
      );
    } on Exception {
      if (isClosed) return;
      emit(state.copyWith(status: EditorStatus.error, cardId: cardId));
    }
  }

  void changeLogo(LogoSource newLogo) {
    emit(state.copyWith(selectedLogo: newLogo));
  }

  void changeSelectedCategory(CardCategory newCategory) {
    emit(state.copyWith(selectedCategory: newCategory));
  }

  void changeCardColor(CardColor newColor) {
    emit(
      state.copyWith(
        selectedColor: newColor,
        fieldErrors: state.fieldErrors.copyWith(color: false),
      ),
    );
  }

  void changeBarcodeNumberAndFormat(
    String newBarcodeNumber,
    BarcodeFormat newBarcodeFormat,
  ) {
    emit(
      state.copyWith(
        barcodeNumber: newBarcodeNumber,
        barcodeFormat: newBarcodeFormat,
        fieldErrors: state.fieldErrors.copyWith(barcode: false),
      ),
    );
  }

  void changeShopName(String newShopName) {
    final errors = state.fieldErrors;
    final shopNameStillInvalid = errors.shopName && newShopName.trim().isEmpty;
    emit(
      state.copyWith(
        shopName: newShopName,
        fieldErrors: errors.copyWith(shopName: shopNameStillInvalid),
      ),
    );
  }

  void changeDescription(String newDescription) {
    emit(state.copyWith(description: newDescription));
  }

  Future<bool> saveCard() async {
    final shopName = state.shopName.trim();
    final barcodeNumber = state.barcodeNumber.trim();
    final cardColor = state.selectedColor;
    final errors = EditorFieldErrors(
      shopName: shopName.isEmpty,
      barcode: !BarcodeFormatCodec.isValid(state.barcodeFormat, barcodeNumber),
      color: cardColor == null,
    );
    if (errors != state.fieldErrors) {
      emit(state.copyWith(fieldErrors: errors));
    }
    if (errors.hasAny || cardColor == null) return false;

    await _repository.saveCard(
      DiscountCard(
        id: state.cardId ?? const Uuid().v7(),
        shopName: shopName,
        category: state.selectedCategory,
        color: cardColor,
        barcode: barcodeNumber,
        description: state.description,
        barcodeFormat: state.barcodeFormat,
        logo: state.selectedLogo,
      ),
    );
    return true;
  }

  Future<void> deleteCard() {
    final cardId = state.cardId;
    if (cardId == null) return Future.value();
    return _repository.deleteCard(cardId);
  }
}

class MockEditorCubit extends MockCubit<EditorState> implements EditorCubit {}
