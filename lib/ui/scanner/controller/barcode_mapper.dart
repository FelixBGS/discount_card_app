import 'package:discount_card_app/ui/scanner/controller/scanner_controller.dart';

import '../../../domain/models/barcode.dart';
import '../../../domain/models/barcode_format.dart';

abstract class BarcodeMapper {
  static Barcode fromMap(Map<dynamic, dynamic> map) {
    final safeMap = Map<String, dynamic>.from(map);

    return Barcode(
      barcodeNumber: safeMap[ScannerConstants.eventKeyValue] as String? ?? '',
      barcodeFormat: _parseFormat(
        safeMap[ScannerConstants.eventKeyFormat] as String?,
      ),
    );
  }

  static BarcodeFormat _parseFormat(String? formatString) {
    if (formatString == null || formatString.isEmpty) {
      return BarcodeFormat.unknown;
    }

    for (final format in BarcodeFormat.values) {
      if (format.name == formatString) {
        return format;
      }
    }

    return BarcodeFormat.unknown;
  }
}
