import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

extension CardCategoryToUiMapper on CardCategoryType {
  IconData get icon => switch (this) {
    CardCategoryType.cafeAndRestaurant => Icons.local_cafe,
    CardCategoryType.clothing => Icons.checkroom,
    CardCategoryType.electronics => Icons.computer,
    CardCategoryType.entertainment => Icons.sports_esports,
    CardCategoryType.householdAppliance => Icons.local_laundry_service,
    CardCategoryType.pharmacy => Icons.local_pharmacy,
    CardCategoryType.supermarket => Icons.shopping_cart_outlined,
    CardCategoryType.unknown => Icons.category_outlined,
  };

  String label(AppLocalizations l10n) => switch (this) {
    CardCategoryType.cafeAndRestaurant => l10n.cafeAndRestaurantsCategory,
    CardCategoryType.clothing => l10n.clothingCategory,
    CardCategoryType.electronics => l10n.electronicsCategory,
    CardCategoryType.entertainment => l10n.entertainmentCategory,
    CardCategoryType.householdAppliance => l10n.householdApplianceCategory,
    CardCategoryType.pharmacy => l10n.pharmacyCategory,
    CardCategoryType.supermarket => l10n.supermarketCategory,
    CardCategoryType.unknown => l10n.unknownCategory,
  };
}
