import 'package:discount_card_app/domain/models/barcode_format.dart';

extension BarcodeFormatUi on BarcodeFormat {
  String get displayName => switch (this) {
    BarcodeFormat.ean8 => 'EAN-8',
    BarcodeFormat.ean13 => 'EAN-13',
    BarcodeFormat.code39 => 'Code 39',
    BarcodeFormat.code128 => 'Code 128',
    BarcodeFormat.qrCode => 'QR',
    BarcodeFormat.unknown => '',
  };
}
