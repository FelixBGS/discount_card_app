import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:path_provider/path_provider.dart';

import '../../domain/service/logo_file_service.dart';

class LogoFileServiceImpl implements LogoFileService {
  LogoFileServiceImpl();

  static const _dirName = "logos";

  Directory? _logosDir;

  @override
  Future<LogoSource> persistLocal(String sourcePath) async {
    final logosDir = await _getDirectory();

    if (_isInside(sourcePath, logosDir)) {
      return LogoSource.localFile(sourcePath);
    }

    final source = File(sourcePath);
    if (!await source.exists()) {
      throw StateError("Logo source does not exist: $sourcePath");
    }

    final bytes = await source.readAsBytes();
    final hash = sha256.convert(bytes).toString();
    final dest = File(
      "${logosDir.path}/$hash${_normalizedExtension(sourcePath)}",
    );

    if (!await dest.exists()) {
      await dest.writeAsBytes(bytes, flush: true);
    }

    return LogoSource.localFile(dest.path);
  }

  Future<Directory> _getDirectory() async {
    final cached = _logosDir;
    if (cached != null) return cached;

    final docs = await getApplicationDocumentsDirectory();
    final dir = Directory("${docs.path}/$_dirName");
    await dir.create(recursive: true);
    return _logosDir = dir;
  }

  bool _isInside(String path, Directory logosDir) {
    final normalizedPath = path.replaceAll('\\', '/');
    final normalizedDir = logosDir.path.replaceAll('\\', '/');
    return normalizedPath.startsWith('$normalizedDir/');
  }

  String _normalizedExtension(String path) {
    final dot = path.lastIndexOf('.');
    final ext = (dot == -1 ? '' : path.substring(dot)).toLowerCase();
    return switch (ext) {
      '.jpg' || '.jpeg' || '.jpe' => '.jpg',
      '.png' => '.png',
      '.webp' => '.webp',
      '.heic' || '.heif' => '.heic',
      '.svg' => '.svg',
      _ => '.jpg',
    };
  }
}
