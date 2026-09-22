enum BarcodeFormat {
  ean8,
  ean13,
  code39,
  code128,
  qrCode,
  unknown;

  @override
  String toString() => switch (this) {
    BarcodeFormat.ean8 => 'EAN-8',
    BarcodeFormat.ean13 => 'EAN-13',
    BarcodeFormat.code39 => 'Code 39',
    BarcodeFormat.code128 => 'Code 128',
    BarcodeFormat.qrCode => 'QR',
    BarcodeFormat.unknown => '',
  };
}
