import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/ui/editor/widgets/color_variant.dart';
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
  final List<CardColor> colors;
  final ValueChanged<CardColor> onColorSelected;
  final CardColor? selectedColor;

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
    colors: CardColor.selectable,
    onColorSelected: (color) {},
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
    colors: CardColor.selectable,
    onColorSelected: (color) {},
    selectedColor: CardColor.red,
  ),
);
