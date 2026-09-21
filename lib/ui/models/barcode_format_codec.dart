import 'package:barcode_widget/barcode_widget.dart';
import 'package:discount_card_app/domain/models/barcode_format.dart';

abstract final class BarcodeFormatCodec {
  static Barcode? encoder(BarcodeFormat format) => switch (format) {
    BarcodeFormat.ean8 => Barcode.ean8(),
    BarcodeFormat.ean13 => Barcode.ean13(),
    BarcodeFormat.code39 => Barcode.code39(),
    BarcodeFormat.code128 => Barcode.code128(),
    BarcodeFormat.qrCode => Barcode.qrCode(),
    BarcodeFormat.unknown => null,
  };

  static bool isTwoDimensional(BarcodeFormat format) =>
      format == BarcodeFormat.qrCode;

  static bool isValid(BarcodeFormat format, String data) {
    if (data.isEmpty) return false;
    final barcode = encoder(format);
    if (barcode == null) return false;
    return barcode.isValid(data);
  }
}
