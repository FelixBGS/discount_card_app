import 'dart:io';

import 'package:discount_card_app/domain/models/logo_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UniversalIcon extends StatelessWidget {
  const UniversalIcon({
    super.key,
    required this.logo,
    required this.width,
    required this.height,
    this.borderRadius = 0,
  });

  final LogoSource logo;
  final double width;
  final double height;
  final double borderRadius;

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
    final int? cacheWidth = width > 0 ? (width * pixelRatio).round() : null;
    final int? cacheHeight = height > 0 ? (height * pixelRatio).round() : null;

    return switch (logo) {
      EmptyLogo() => _buildFallback(context),

      AssetLogo(path: var path) =>
        logo.isSvg
            ? SvgPicture.asset(path, width: width, height: height)
            : Image.asset(
                path,
                width: width,
                height: height,
                cacheWidth: cacheWidth,
                cacheHeight: cacheHeight,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildFallback(context),
              ),

      NetworkLogo(url: var url) =>
        logo.isSvg
            ? SvgPicture.network(url, width: width, height: height)
            : Image.network(
                url,
                width: width,
                height: height,
                cacheWidth: cacheWidth,
                cacheHeight: cacheHeight,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    _buildFallback(context),
              ),

      LocalFileLogo(path: var path) =>
        logo.isSvg
            ? SvgPicture.file(File(path), width: width, height: height)
            : Image.file(
                File(path),
                width: width,
                height: height,
                cacheWidth: cacheWidth,
                cacheHeight: cacheHeight,
                fit: BoxFit.cover,
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
    );
  }
}
