import 'package:flutter/material.dart';

abstract final class AppColors {
  static const Color background = Color(0xFF000000);
  static const Color surface = Color(0xFF1C1C1E);
  static const Color surfaceCard = Color(0xFF1A1A1A);
  static const Color surfaceElevated = Color(0xFF2C2C2E);
  static const Color border = Color(0xFF3A3A3C);
  static const Color borderSubtle = Color(0xFF2A2A2A);

  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color textMuted = Color(0xFF6B7280);

  static const Color accentTeal = Color(0xFF2DD4BF);
  static const Color accentGreen = Color(0xFF4ADE80);
  static const Color accentBlue = Color(0xFF60A5FA);
  static const Color accentPurple = Color(0xFFAF52DE);
  static const Color accentOrange = Color(0xFFFF9F6B);

  static const Color workoutBar = Color(0xFF2DD4BF);
  static const Color armsBadge = Color(0xFF4ADE80);
  static const Color armsBadgeBg = Color(0xFF1A2E1A);
  static const Color legsBadge = Color(0xFF60A5FA);
  static const Color legsBadgeBg = Color(0xFF1A2533);

  static const Color weekDividerPurple = Color(0xFFAF52DE);
  static const Color weekDividerTeal = Color(0xFF2DD4BF);
  static const Color hydrationBarBg = Color(0xFF134E4A);
  static const Color moodGlow = Color(0xFF1A1A3E);

  static const List<Color> moodRingGradient = [
    Color(0xFFFF9F6B),
    Color(0xFFFF6482),
    Color(0xFFC4B5FD),
    Color(0xFF7DD3FC),
    Color(0xFF6EE7B7),
    Color(0xFFFF9F6B),
  ];

  static const List<Color> calorieProgressGradient = [
    Color(0xFF2DD4BF),
    Color(0xFF4ADE80),
  ];
}
