import 'package:discount_card_app/ui/editor/widgets/color_variant.dart';
import 'package:discount_card_app/ui/shared/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../util/utils.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
    required this.titleText,
    required this.colors,
    required this.onColorSelected,
    required this.selectedColor,
  });

  final String titleText;
  final List<Color> colors;
  final ValueChanged<Color> onColorSelected;
  final Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(titleText, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: colors.map((color) {
            final isSelected = color == selectedColor;
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ColorVariant(
                  color: color,
                  isSelected: isSelected,
                  onColorSelected: onColorSelected,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

@Preview(
  name: "Color Selector",
  theme: appPreviewTheme,
  wrapper: whiteBackgroundPreview,
)
Widget colorSelectorPreview() => ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 500),
  child: ColorSelector(
    titleText: "Цвет карты",
    colors: AppColors.cardColors,
    onColorSelected: (color) => {},
    selectedColor: null,
  ),
);

@Preview(
  name: "Color Selector Selected",
  theme: appPreviewTheme,
  wrapper: whiteBackgroundPreview,
)
Widget colorSelectorSelectedPreview() => ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 500),
  child: ColorSelector(
    titleText: "Цвет карты",
    colors: AppColors.cardColors,
    onColorSelected: (color) => {},
    selectedColor: AppColors.cardRed,
  ),
);
