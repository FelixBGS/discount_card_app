import 'package:discount_card_app/domain/models/logo_source.dart';

abstract interface class LogoFileService {
  Future<LogoSource> persistLocal(String sourcePath);
}
