import 'package:discount_card_app/domain/models/barcode_format.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'barcode.freezed.dart';

@freezed
class Barcode with _$Barcode {
  const Barcode({required this.barcodeNumber, required this.barcodeFormat});

  final String barcodeNumber;
  final BarcodeFormat barcodeFormat;
}
