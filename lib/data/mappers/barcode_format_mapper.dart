import 'package:discount_card_app/data/models/api/barcode_format_api.dart';
import 'package:discount_card_app/domain/models/barcode_format.dart';

abstract final class BarcodeFormatMapper {
  static BarcodeFormat fromApi(String? value) {
    switch (value) {
      case BarcodeFormatApi.ean8:
        return BarcodeFormat.ean8;
      case BarcodeFormatApi.ean13:
        return BarcodeFormat.ean13;
      case BarcodeFormatApi.code39:
        return BarcodeFormat.code39;
      case BarcodeFormatApi.code128:
        return BarcodeFormat.code128;
      case BarcodeFormatApi.qrCode:
        return BarcodeFormat.qrCode;
      default:
        return BarcodeFormat.unknown;
    }
  }

  static String toApi(BarcodeFormat value) {
    switch (value) {
      case BarcodeFormat.ean8:
        return BarcodeFormatApi.ean8;
      case BarcodeFormat.ean13:
        return BarcodeFormatApi.ean13;
      case BarcodeFormat.code39:
        return BarcodeFormatApi.code39;
      case BarcodeFormat.code128:
        return BarcodeFormatApi.code128;
      case BarcodeFormat.qrCode:
        return BarcodeFormatApi.qrCode;
      case BarcodeFormat.unknown:
        return BarcodeFormatApi.unknown;
    }
  }
}
