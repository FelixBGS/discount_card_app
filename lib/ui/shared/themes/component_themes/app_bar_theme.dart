import 'package:discount_card_app/ui/shared/themes/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';

abstract final class AppAppBarTheme {
  static const AppBarTheme light = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: false,
    backgroundColor: AppColors.background,
    foregroundColor: AppColors.textPrimary,
    surfaceTintColor: Colors.transparent,
    titleSpacing: AppSpacing.lg,
    actionsPadding: EdgeInsets.only(right: AppSpacing.md),
    iconTheme: IconThemeData(
      color: AppColors.textPrimary,
      size: AppSizes.iconLarge,
    ),
    actionsIconTheme: IconThemeData(
      color: AppColors.textPrimary,
      size: AppSizes.iconLarge,
    ),
    titleTextStyle: TextStyle(
      color: AppColors.textPrimary,
      fontSize: 20,
      height: 1.2,
      fontWeight: FontWeight.w700,
      letterSpacing: -0.3,
    ),
  );
}
