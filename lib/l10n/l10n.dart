import 'package:discount_card_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension L10nX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
