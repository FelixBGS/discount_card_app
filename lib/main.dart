import 'package:discount_card_app/core/di/injection.dart';
import 'package:discount_card_app/l10n/app_localizations.dart';
import 'package:discount_card_app/ui/shared/themes/app_theme.dart';
import 'package:discount_card_app/ui/shell/app_shell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.light,
      home: const AppShell(),
    );
  }
}
