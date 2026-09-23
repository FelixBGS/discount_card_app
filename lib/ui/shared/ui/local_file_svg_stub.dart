import 'package:flutter/widgets.dart';

Widget localFileSvg({
  required String path,
  double? width,
  double? height,
  BoxFit fit = BoxFit.contain,
  required Widget fallback,
}) {
  return SizedBox(width: width, height: height, child: fallback);
}
