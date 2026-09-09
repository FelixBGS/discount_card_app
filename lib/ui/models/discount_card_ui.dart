import 'package:discount_card_app/domain/models/card_category_type.dart';
import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/domain/models/discount_card.dart';
import 'package:discount_card_app/ui/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

class DiscountCardUi {
  final String id;
  final String shopName;
  final CardCategoryType category;
  final Color backgroundColor;
  final String? iconUrl;
  final String localIconAsset;

  const DiscountCardUi({
    required this.id,
    required this.shopName,
    required this.category,
    required this.backgroundColor,
    required this.localIconAsset,
    this.iconUrl,
  });
}

extension DiscountCardToUiMapper on DiscountCard {
  DiscountCardUi toUi() {
    return DiscountCardUi(
      id: id,
      shopName: shopName,
      category: category,
      backgroundColor: _mapColor(color),
      iconUrl: logoUrl,
      localIconAsset:"assets/images/icons/ic_question_mark_circle.svg",
    );
  }

  Color _mapColor(CardColor color) => switch (color) {
        CardColor.red => AppColors.cardRed,
        CardColor.orange => AppColors.cardOrange,
        CardColor.yellow => AppColors.cardYellow,
        CardColor.green => AppColors.cardGreen,
        CardColor.blue => AppColors.cardBlue,
        CardColor.darkBlue => AppColors.cardDarkBlue,
        CardColor.purple => AppColors.cardPurple,
        CardColor.unknown => AppColors.cardRed,
      };
}
