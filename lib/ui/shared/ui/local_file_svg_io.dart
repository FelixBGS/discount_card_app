import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

Widget localFileSvg({
  required String path,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
  required Widget fallback,
}) {
  return SvgPicture.file(
    File(path),
    width: width,
    height: height,
    fit: fit,
    errorBuilder: (context, error, stackTrace) => fallback,
  );
}
