import 'package:flutter/material.dart';

/// Ethiopian flag colors for Miliket app design system
class AppColors {
  AppColors._();

  // Ethiopian Flag Colors
  static const Color green = Color(0xFF0F6A3C);
  static const Color yellow = Color(0xFFFBC412);
  static const Color red = Color(0xFFD11241);

  // Semantic colors
  static const Color primary = green;
  static const Color secondary = yellow;
  static const Color accent = red;

  // Neutral colors
  static const Color background = Color(0xFFF8F9FA);
  static const Color surface = Colors.white;
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color divider = Color(0xFFE5E7EB);

  // Progress & feedback
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Gradients
  static const LinearGradient ethiopianGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [green, yellow, red],
  );

  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [green, Color(0xFF0D5A32)],
  );
}
