import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/ui/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';

@immutable
final class CardPalette extends ThemeExtension<CardPalette> {
  const CardPalette({
    required this.red,
    required this.orange,
    required this.yellow,
    required this.green,
    required this.blue,
    required this.darkBlue,
    required this.purple,
    required this.fallback,
  });

  static const light = CardPalette(
    red: AppColors.cardRed,
    orange: AppColors.cardOrange,
    yellow: AppColors.cardYellow,
    green: AppColors.cardGreen,
    blue: AppColors.cardBlue,
    darkBlue: AppColors.cardDarkBlue,
    purple: AppColors.cardPurple,
    fallback: AppColors.textSecondary,
  );

  final Color red;
  final Color orange;
  final Color yellow;
  final Color green;
  final Color blue;
  final Color darkBlue;
  final Color purple;

  final Color fallback;

  Color resolve(CardColor color) => switch (color) {
    CardColor.red => red,
    CardColor.orange => orange,
    CardColor.yellow => yellow,
    CardColor.green => green,
    CardColor.blue => blue,
    CardColor.purple => purple,
    CardColor.unknown => fallback,
  };

  @override
  CardPalette copyWith({
    Color? red,
    Color? orange,
    Color? yellow,
    Color? green,
    Color? blue,
    Color? darkBlue,
    Color? purple,
    Color? fallback,
  }) {
    return CardPalette(
      red: red ?? this.red,
      orange: orange ?? this.orange,
      yellow: yellow ?? this.yellow,
      green: green ?? this.green,
      blue: blue ?? this.blue,
      darkBlue: darkBlue ?? this.darkBlue,
      purple: purple ?? this.purple,
      fallback: fallback ?? this.fallback,
    );
  }

  @override
  CardPalette lerp(CardPalette? other, double t) {
    if (other == null) return this;

    return CardPalette(
      red: Color.lerp(red, other.red, t)!,
      orange: Color.lerp(orange, other.orange, t)!,
      yellow: Color.lerp(yellow, other.yellow, t)!,
      green: Color.lerp(green, other.green, t)!,
      blue: Color.lerp(blue, other.blue, t)!,
      darkBlue: Color.lerp(darkBlue, other.darkBlue, t)!,
      purple: Color.lerp(purple, other.purple, t)!,
      fallback: Color.lerp(fallback, other.fallback, t)!,
    );
  }
}

extension CardPaletteX on BuildContext {
  CardPalette get cardPalette =>
      Theme.of(this).extension<CardPalette>() ?? CardPalette.light;
}
