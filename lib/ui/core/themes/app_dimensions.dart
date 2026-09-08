import 'package:flutter/painting.dart';

import 'package:flutter/material.dart';

abstract final class AppSpacing {
  static const double none = 0;
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  static const screenHorizontal = EdgeInsets.symmetric(horizontal: lg);

  static const screen = EdgeInsets.symmetric(horizontal: lg, vertical: md);

  static const contentPadding = EdgeInsets.all(md);
}

abstract final class AppSizes {
  // Иконки
  static const double iconSmall = 16;
  static const double iconMedium = 24;
  static const double iconLarge = 28;
  static const double iconExtraLarge = 32;

  // Высота компонентов
  static const double buttonHeight = 52;
  static const double inputHeight = 48;
  static const double navigationBarHeight = 64;

  // Радиусы
  static const double radiusSmall = 8;
  static const double radiusMedium = 12;
  static const double radiusLarge = 16;
  static const double radiusExtraLarge = 24;

  // Границы
  static const double borderWidth = 1;
}
