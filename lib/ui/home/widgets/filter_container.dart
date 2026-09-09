import 'package:discount_card_app/ui/shared/themes/app_colors.dart';
import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

class FilterContainer extends StatelessWidget {
  const FilterContainer({
    super.key,
    required this.filterName,
    this.isSelected = false,
    required this.onSelected,
  });

  final bool isSelected;
  final String filterName;
  final ValueChanged<void> onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      showCheckmark: false,
      selected: isSelected,
      onSelected: onSelected,
      label: Text(filterName),
      side: BorderSide.none,
      backgroundColor: AppColors.inputBackground,
      selectedColor: AppColors.primary,
      labelStyle: isSelected
          ? const TextStyle(color: Colors.white)
          : const TextStyle(color: AppColors.textPrimary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
      ),
    );
  }
}
