import 'package:discount_card_app/ui/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

PreviewThemeData appPreviewTheme() => const AppPreviewTheme();

final class AppPreviewTheme extends PreviewThemeData {
  const AppPreviewTheme();

  @override
  Widget apply(BuildContext context, Widget child) {
    return Theme(data: AppTheme.light, child: child);
  }
}

Widget whiteBackgroundPreview(Widget child) {
  return ColoredBox(color: Colors.white, child: child);
}
