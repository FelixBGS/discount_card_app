import 'dart:io';

import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:discount_card_app/ui/shared/ui/local_file_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UniversalIcon extends StatelessWidget {
  const UniversalIcon({
    super.key,
    required this.logo,
    this.width,
    this.height,
    this.borderRadius = 0,
    this.fit,
  });

  final LogoSource logo;
  final double? width;
  final double? height;
  final double borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox(
        width: width,
        height: height,
        child: _buildImage(context),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    final double pixelRatio = MediaQuery.devicePixelRatioOf(context);
    final int? cacheWidth = (width ?? 0) > 0
        ? (width! * pixelRatio).round()
        : null;
    final int? cacheHeight = (height ?? 0) > 0
        ? (height! * pixelRatio).round()
        : null;

    return switch (logo) {
      EmptyLogo() => _buildFallback(context),

      AssetLogo(path: var path) =>
        logo.isSvg
            ? SvgPicture.asset(
                path,
                width: width,
                height: height,
                fit: fit ?? BoxFit.contain,
              )
            : Image.asset(
                path,
                width: width,
                height: height,
                cacheWidth: cacheWidth,
                cacheHeight: cacheHeight,
                fit: fit ?? BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildFallback(context),
              ),

      NetworkLogo(url: var url) =>
        logo.isSvg
            ? SvgPicture.network(
                url,
                width: width,
                height: height,
                fit: fit ?? BoxFit.contain,
              )
            : Image.network(
                url,
                width: width,
                height: height,
                cacheWidth: cacheWidth,
                cacheHeight: cacheHeight,
                fit: fit ?? BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildFallback(context),
              ),

      LocalFileLogo(path: var path) =>
        logo.isSvg
            ? localFileSvg(
                path: path,
                width: width,
                height: height,
                fit: fit ?? BoxFit.contain,
                fallback: _buildFallback(context),
              )
            : Image.file(
                File(path),
                width: width,
                height: height,
                cacheWidth: cacheWidth,
                cacheHeight: cacheHeight,
                fit: fit ?? BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildFallback(context),
              ),
    };
  }

  Widget _buildFallback(BuildContext context) {
    return SvgPicture.asset(
      "assets/images/icons/ic_question_mark_circle.svg",
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
    );
  }
}
