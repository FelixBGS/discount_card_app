import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/ui/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

extension CardColorUi on CardColor {
  static const pickerValues = [
    CardColor.red,
    CardColor.orange,
    CardColor.yellow,
    CardColor.green,
    CardColor.blue,
    CardColor.darkBlue,
    CardColor.purple,
  ];

  Color get color => switch (this) {
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
