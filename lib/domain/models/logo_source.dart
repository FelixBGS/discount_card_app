import 'package:equatable/equatable.dart';

sealed class LogoSource extends Equatable {
  const LogoSource();

  static LogoSource parse(String? url) {
    if (url == null || url.trim().isEmpty) return EmptyLogo();

    final lowerUrl = url.trim().toLowerCase();

    if (lowerUrl.startsWith("asset://") || lowerUrl.startsWith("assets/")) {
      return AssetLogo(url.trim());
    }

    if (lowerUrl.startsWith("http://") || lowerUrl.startsWith("https://")) {
      return NetworkLogo(url.trim());
    }

    if (lowerUrl.startsWith("file://") || lowerUrl.startsWith("/")) {
      final cleanPath = url.replaceFirst(
        RegExp(r'^file://', caseSensitive: false),
        '',
      );
      return LocalFileLogo(cleanPath);
    }

    return EmptyLogo();
  }

  String? toRawUrl();

  bool get isSvg => toRawUrl()?.toLowerCase().endsWith(".svg") ?? false;
}

class AssetLogo extends LogoSource {
  final String path;
  const AssetLogo(this.path);

  @override
  String toRawUrl() => path;

  @override
  List<Object?> get props => [path];
}

class NetworkLogo extends LogoSource {
  final String url;
  const NetworkLogo(this.url);

  @override
  String? toRawUrl() => url;

  @override
  List<Object?> get props => [url];
}

class LocalFileLogo extends LogoSource {
  final String path;
  const LocalFileLogo(this.path);

  @override
  String toRawUrl() => path;

  @override
  List<Object?> get props => [path];
}

class EmptyLogo extends LogoSource {
  const EmptyLogo();

  @override
  String? toRawUrl() => null;

  @override
  List<Object?> get props => [];
}
