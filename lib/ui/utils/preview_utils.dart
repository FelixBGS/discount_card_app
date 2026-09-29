import 'package:discount_card_app/l10n/app_localizations.dart';
import 'package:discount_card_app/ui/shared/themes/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter/widget_previews.dart';

PreviewThemeData appPreviewTheme() => const AppPreviewTheme();

PreviewLocalizationsData appPreviewLocalizations() => const PreviewLocalizationsData(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );

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
