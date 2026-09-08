import 'package:flutter/material.dart';

abstract final class AppColors {
  static const primary = Color(0xFF4C50F6);
  static const primaryDark = Color(0xFF383CE0);
  static const primaryContainer = Color(0xFFE7E8FF);

  static const background = Color(0xFFF7F8FC);
  static const surface = Color(0xFFFFFFFF);

  static const textPrimary = Color(0xFF181B25);
  static const textSecondary = Color(0xFF7B8190);

  static const border = Color(0xFFE7E9F0);
  static const inputBackground = Color(0xFFF1F2F6);

  static const danger = Color(0xFFF04455);
  static const disabled = Color(0xFFB7B9F8);

  // Цвета карт лояльности
  static const cardRed = Color(0xFFF02E35);
  static const cardGreen = Color(0xFF27B767);
  static const cardBlue = Color(0xFF2382D8);
  static const cardOrange = Color(0xFFFF851B);
  static const cardPurple = Color(0xFF7747D7);

  static const cardColors = [
    cardRed,
    cardGreen,
    cardBlue,
    cardOrange,
    cardPurple,
  ];
}
