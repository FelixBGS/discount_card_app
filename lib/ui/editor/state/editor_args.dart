import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "editor_args.freezed.dart";

@freezed
sealed class EditorArgs with _$EditorArgs {
  const factory EditorArgs.blank() = Blank;

  const factory EditorArgs.fromCamera({
    required String barcodeNumber,
    required BarcodeFormat barcodeFormat,
  }) = FromCamera;

  const factory EditorArgs.fromDetails({required String cardId}) = FromDetails;

  static EditorArgs createFromQuery({
    String? barcodeNumber,
    BarcodeFormat? barcodeFormat,
  }) => switch ((barcodeNumber, barcodeFormat)) {
    (null, null) => const EditorArgs.blank(),
    (final String number, final BarcodeFormat format) => EditorArgs.fromCamera(
      barcodeNumber: number,
      barcodeFormat: format,
    ),
    _ => throw FormatException(
      "barcodeNumber and barcodeFormat must be passed together",
    ),
  };
}
