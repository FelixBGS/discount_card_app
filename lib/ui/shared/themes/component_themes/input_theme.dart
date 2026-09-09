import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

abstract final class AppInputTheme {
  static InputDecorationTheme get light {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputBackground,
      hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
      prefixIconColor: AppColors.textSecondary,
      suffixIconColor: AppColors.textSecondary,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.sm,
      ),
      border: _border(Colors.transparent),
      enabledBorder: _border(Colors.transparent),
      focusedBorder: _border(AppColors.primary),
      errorBorder: _border(AppColors.danger),
      focusedErrorBorder: _border(AppColors.danger),
    );
  }

  static OutlineInputBorder _border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.radiusMedium),
      borderSide: BorderSide(color: color, width: AppSizes.borderWidth),
    );
  }
}
