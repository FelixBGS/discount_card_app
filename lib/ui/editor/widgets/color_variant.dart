import 'package:discount_card_app/ui/shared/themes/app_colors.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
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

  final Color color;
  final bool isSelected;
  final ValueChanged<Color> onColorSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onColorSelected(color),
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          padding: const EdgeInsets.all(2),
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
            decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          ),
        ),
      ),
    );
  }
}

@Preview(name: "Color Variant Neutral", theme: appPreviewTheme)
Widget colorVariantNeutralPreview() => Material(
  color: Colors.transparent,
  child: Center(
    child: SizedBox(
      width: 48,
      child: ColorVariant(
        color: AppColors.cardRed,
        isSelected: false,
        onColorSelected: (color) => {},
      ),
    ),
  ),
);

@Preview(name: "Color Variant Selected", theme: appPreviewTheme)
Widget colorVariantSelectedPreview() => Material(
  color: Colors.transparent,
  child: Center(
    child: SizedBox(
      width: 48,
      child: ColorVariant(
        color: AppColors.cardRed,
        isSelected: true,
        onColorSelected: (color) => {},
      ),
    ),
  ),
);
