import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/ui/editor/state/editor_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/models/card_color.dart';

class EditorCubit extends Cubit<EditorState> {
  EditorCubit() : super(const EditorState());

  void changeLogo(LogoSource newLogo) {
    emit(state.copyWith(selectedLogo: newLogo));
  }

  void changeSelectedCategory(CardCategoryType newCategory) {
    emit(state.copyWith(selectedCategory: newCategory));
  }

  void changeCardColor(CardColor newColor) {
    emit(state.copyWith(selectedColor: newColor));
  }

  void changeBarcodeNumberAndFormat(
    String newBarcodeNumber,
    BarcodeFormat newBarcodeFormat,
  ) {
    emit(
      state.copyWith(
        barcodeNumber: newBarcodeNumber,
        barcodeFormat: newBarcodeFormat,
      ),
    );
  }
}
