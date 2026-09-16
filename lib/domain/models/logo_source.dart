import 'package:freezed_annotation/freezed_annotation.dart';

part 'logo_source.freezed.dart';

@freezed
sealed class LogoSource with _$LogoSource {
  const LogoSource._();

  const factory LogoSource.empty() = EmptyLogo;
  const factory LogoSource.asset(String path) = AssetLogo;
  const factory LogoSource.network(String url) = NetworkLogo;
  const factory LogoSource.localFile(String path) = LocalFileLogo;

  static LogoSource parse(String? url) {
    if (url == null || url.trim().isEmpty) return EmptyLogo();

    final trimmed = url.trim();
    final lowerUrl = trimmed.toLowerCase();

    if (lowerUrl.startsWith("asset://") || lowerUrl.startsWith("assets/")) {
      return LogoSource.asset(trimmed);
    }

    if (lowerUrl.startsWith("http://") || lowerUrl.startsWith("https://")) {
      return LogoSource.network(trimmed);
    }

    if (lowerUrl.startsWith("file://") || lowerUrl.startsWith("/")) {
      final cleanPath = trimmed.replaceFirst(
        RegExp(r'^file://', caseSensitive: false),
        '',
      );
      return LogoSource.localFile(cleanPath);
    }

    return const LogoSource.empty();
  }

  String? toRawUrl() => switch (this) {
    AssetLogo(:final path) => path,
    NetworkLogo(:final url) => url,
    LocalFileLogo(:final path) => path,
    EmptyLogo() => null,
  };

  bool get isSvg => toRawUrl()?.toLowerCase().endsWith(".svg") ?? false;
}
