import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/logo_source.dart';

part 'editor_state.freezed.dart';

@freezed
class EditorState with _$EditorState {
  const EditorState({
    this.selectedLogo = const EmptyLogo(),
    this.selectedCategory = CardCategoryType.unknown,
    this.selectedColor,
    this.barcodeNumber = "",
    this.barcodeFormat = BarcodeFormat.ean8,
  });

  final LogoSource selectedLogo;
  final CardCategoryType selectedCategory;
  final CardColor? selectedColor;
  final String barcodeNumber;
  final BarcodeFormat barcodeFormat;
}
