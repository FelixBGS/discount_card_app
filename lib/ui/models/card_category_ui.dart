import 'package:discount_card_app/data/catalog/category_catalog.dart';
import 'package:discount_card_app/domain/models/card_category.dart';
import 'package:discount_card_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension CardCategoryUi on CardCategory {
  IconData get icon =>
      CategoryCatalog.current?.iconOf(this) ?? Icons.category_outlined;

  String label(AppLocalizations l10n) =>
      CategoryCatalog.current?.nameOf(this) ?? l10n.unknownCategory;

  static List<CardCategory> get selectable =>
      CategoryCatalog.current?.categories ?? const [];
}
