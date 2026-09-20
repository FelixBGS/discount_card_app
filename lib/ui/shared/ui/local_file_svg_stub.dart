import 'package:flutter/widgets.dart';

Widget localFileSvg({
  required String path,
  required double width,
  required double height,
  required Widget fallback,
}) {
  return SizedBox(width: width, height: height, child: fallback);
}
