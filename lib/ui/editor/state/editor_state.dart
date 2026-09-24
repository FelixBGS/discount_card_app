import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/models/logo_source.dart';

part 'editor_state.freezed.dart';

enum EditorStatus { loading, ready, error }

final class EditorFieldErrors {
  const EditorFieldErrors({
    this.shopName = false,
    this.barcode = false,
    this.color = false,
  });

  final bool shopName;
  final bool barcode;
  final bool color;

  bool get hasAny => shopName || barcode || color;

  EditorFieldErrors copyWith({bool? shopName, bool? barcode, bool? color}) {
    return EditorFieldErrors(
      shopName: shopName ?? this.shopName,
      barcode: barcode ?? this.barcode,
      color: color ?? this.color,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is EditorFieldErrors &&
        other.shopName == shopName &&
        other.barcode == barcode &&
        other.color == color;
  }

  @override
  int get hashCode => Object.hash(shopName, barcode, color);
}

@freezed
class EditorState with _$EditorState {
  const EditorState({
    this.status = EditorStatus.ready,
    this.selectedLogo = const EmptyLogo(),
    this.shopName = "",
    this.selectedCategory = CardCategory.unknown,
    this.selectedColor,
    this.barcodeNumber = "",
    this.barcodeFormat = BarcodeFormat.ean8,
    this.description = "",
    this.fieldErrors = const EditorFieldErrors(),
    this.cardId,
  });

  final EditorStatus status;
  final LogoSource selectedLogo;
  final String shopName;
  final CardCategory selectedCategory;
  final CardColor? selectedColor;
  final String barcodeNumber;
  final BarcodeFormat barcodeFormat;
  final String description;
  final EditorFieldErrors fieldErrors;
  final String? cardId;
}
