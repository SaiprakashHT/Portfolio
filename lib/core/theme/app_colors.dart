import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF6C63FF);
  static const Color primaryLight = Color(0xFF9D97FF);
  static const Color primaryDark = Color(0xFF4B44CC);

  // Secondary Colors
  static const Color secondary = Color(0xFF00D9FF);
  static const Color secondaryLight = Color(0xFF5CEFFF);
  static const Color secondaryDark = Color(0xFF00A3CC);

  // Accent Colors
  static const Color accent = Color(0xFFFF6B9D);
  static const Color accentLight = Color(0xFFFF9EC4);
  static const Color accentDark = Color(0xFFCC3366);

  // Background Colors - Dark Theme
  static const Color backgroundDark = Color(0xFF0A0A0F);
  static const Color backgroundDarkSecondary = Color(0xFF12121A);
  static const Color surfaceDark = Color(0xFF1A1A25);
  static const Color cardDark = Color(0xFF22222F);

  // Background Colors - Light Theme
  static const Color backgroundLight = Color(0xFFF8F9FC);
  static const Color backgroundLightSecondary = Color(0xFFFFFFFF);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFF0F2F5);

  // Text Colors - Dark Theme
  static const Color textPrimaryDark = Color(0xFFFFFFFF);
  static const Color textSecondaryDark = Color(0xFFB8B8C7);
  static const Color textTertiaryDark = Color(0xFF6B6B7B);

  // Text Colors - Light Theme
  static const Color textPrimaryLight = Color(0xFF1A1A2E);
  static const Color textSecondaryLight = Color(0xFF4A4A5A);
  static const Color textTertiaryLight = Color(0xFF8A8A9A);

  // Status Colors
  static const Color success = Color(0xFF00C853);
  static const Color warning = Color(0xFFFFB300);
  static const Color error = Color(0xFFFF5252);
  static const Color info = Color(0xFF2196F3);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF6C63FF),
    Color(0xFF00D9FF),
  ];

  static const List<Color> secondaryGradient = [
    Color(0xFFFF6B9D),
    Color(0xFF6C63FF),
  ];

  static const List<Color> accentGradient = [
    Color(0xFF00D9FF),
    Color(0xFF00FF88),
  ];

  // Skill Category Colors
  static const Color flutterColor = Color(0xFF02569B);
  static const Color laravelColor = Color(0xFFFF2D20);
  static const Color firebaseColor = Color(0xFFFFCA28);
  static const Color nodeColor = Color(0xFF339933);
  static const Color reactColor = Color(0xFF61DAFB);
  static const Color javaColor = Color(0xFFED8B00);
  static const Color mysqlColor = Color(0xFF4479A1);
  static const Color gitColor = Color(0xFFF05032);
}
