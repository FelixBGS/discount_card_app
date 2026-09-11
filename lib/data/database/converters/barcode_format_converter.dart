import 'package:drift/drift.dart';

import '../../../domain/models/barcode_format.dart';

class BarcodeFormatConverter extends TypeConverter<BarcodeFormat, String> {
  const BarcodeFormatConverter();

  @override
  BarcodeFormat fromSql(String fromDb) => switch (fromDb) {
    "EAN8" => BarcodeFormat.ean8,
    "EAN13" => BarcodeFormat.ean13,
    "CODE39" => BarcodeFormat.code39,
    "CODE128" => BarcodeFormat.code128,
    "QR_CODE" => BarcodeFormat.qrCode,
    _ => BarcodeFormat.unknown,
  };

  @override
  String toSql(BarcodeFormat value) => switch (value) {
    BarcodeFormat.ean8 => "EAN8",
    BarcodeFormat.ean13 => "EAN13",
    BarcodeFormat.code39 => "CODE39",
    BarcodeFormat.code128 => "CODE128",
    BarcodeFormat.qrCode => "QR_CODE",
    BarcodeFormat.unknown => "UNKNOWN",
  };

}