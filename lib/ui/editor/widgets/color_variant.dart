import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:discount_card_app/ui/shared/themes/card_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../util/utils.dart';

class ColorVariant extends StatelessWidget {
  const ColorVariant({
    super.key,
    required this.color,
    required this.isSelected,
    required this.onColorSelected,
  });

  final CardColor color;
  final bool isSelected;
  final ValueChanged<CardColor> onColorSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onColorSelected(color),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.xxs),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isSelected
                  ? Theme.of(context).colorScheme.outline
                  : Colors.transparent,
              width: AppSizes.borderWidth,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: context.cardPalette.resolve(color),
            ),
          ),
        ),
      ),
    );
  }
}

@Preview(
  name: "Color Variant Neutral",
  group: "Editor Screen",
  theme: appPreviewTheme,
)
Widget colorVariantNeutralPreview() => Material(
  color: Colors.transparent,
  child: Center(
    child: SizedBox(
      width: 48,
      child: ColorVariant(
        color: CardColor.red,
        isSelected: false,
        onColorSelected: (color) {},
      ),
    ),
  ),
);

@Preview(
  name: "Color Variant Selected",
  group: "Editor Screen",
  theme: appPreviewTheme,
)
Widget colorVariantSelectedPreview() => Material(
  color: Colors.transparent,
  child: Center(
    child: SizedBox(
      width: 48,
      child: ColorVariant(
        color: CardColor.red,
        isSelected: true,
        onColorSelected: (color) {},
      ),
    ),
  ),
);
