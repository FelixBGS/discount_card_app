import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';
import 'component_themes/app_bar_theme.dart';
import 'component_themes/button_theme.dart';
import 'component_themes/input_theme.dart';
import 'component_themes/navigation_bar_theme.dart';

abstract final class AppTheme {
  static ThemeData get light {
    const colorScheme = ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: Colors.white,
      primaryContainer: AppColors.primaryContainer,
      onPrimaryContainer: AppColors.primaryDark,
      secondary: AppColors.primary,
      onSecondary: Colors.white,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      error: AppColors.danger,
      onError: Colors.white,
      outline: AppColors.border,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      fontFamily: AppTypography.fontFamily,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.textPrimary,
        displayColor: AppColors.textPrimary,
      ),
      appBarTheme: AppAppBarTheme.light,
      inputDecorationTheme: AppInputTheme.light,
      elevatedButtonTheme: AppButtonTheme.elevated,
      filledButtonTheme: AppButtonTheme.filled,
      textButtonTheme: AppButtonTheme.text,
      navigationBarTheme: AppNavigationBarTheme.light,
      dividerTheme: const DividerThemeData(
        color: AppColors.border,
        thickness: 1,
        space: 1,
      ),
    );
  }
}
