import 'package:discount_card_app/ui/core/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

abstract final class AppNavigationBarTheme {
  static NavigationBarThemeData get light {
    return NavigationBarThemeData(
      height: AppSizes.navigationBarHeight,
      elevation: 0,
      backgroundColor: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      indicatorColor: Colors.transparent,
      iconTheme: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);

        return IconThemeData(
          size: AppSizes.iconSmall,
          color: isSelected ? AppColors.primary : AppColors.textSecondary,
        );
      }),
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        final isSelected = states.contains(WidgetState.selected);

        return TextStyle(
          fontSize: 11,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          color: isSelected ? AppColors.primary : AppColors.textSecondary,
        );
      }),
    );
  }
}
