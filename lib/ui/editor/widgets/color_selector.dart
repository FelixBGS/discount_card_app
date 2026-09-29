import 'package:discount_card_app/domain/models/card_color.dart';
import 'package:discount_card_app/ui/editor/widgets/color_variant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

import '../../shared/themes/app_dimensions.dart';
import '../../utils/preview_utils.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    super.key,
    required this.colors,
    required this.onColorSelected,
    required this.selectedColor,
  });

  final List<CardColor> colors;
  final ValueChanged<CardColor> onColorSelected;
  final CardColor? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: colors.map((color) {
        final isSelected = color == selectedColor;
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
            child: ColorVariant(
              color: color,
              isSelected: isSelected,
              onColorSelected: onColorSelected,
            ),
          ),
        );
      }).toList(),
    );
  }
}

@Preview(
  name: "Color Selector",
  group: "Editor Screen",
  theme: appPreviewTheme,
  wrapper: whiteBackgroundPreview,
)
Widget colorSelectorPreview() => ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 500),
  child: ColorSelector(
    colors: CardColor.selectable,
    onColorSelected: (color) {},
    selectedColor: null,
  ),
);

@Preview(
  name: "Color Selector Selected",
  group: "Editor Screen",
  theme: appPreviewTheme,
  wrapper: whiteBackgroundPreview,
)
Widget colorSelectorSelectedPreview() => ConstrainedBox(
  constraints: const BoxConstraints(maxWidth: 500),
  child: ColorSelector(
    colors: CardColor.selectable,
    onColorSelected: (color) {},
    selectedColor: CardColor.red,
  ),
);
