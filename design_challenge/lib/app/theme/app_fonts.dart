import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppFonts {
  static const String displayFont = 'Inter';
  static const String primaryFont = 'CupertinoSystemDisplay';
  static const String accentFont = 'CupertinoSystemText';

  static TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: displayFont,
      fontWeight: FontWeight.w600,
      fontSize: 120,
      height: 1.5,
      // color: Colors.transparent,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..strokeWidth = 6
        ..strokeJoin = StrokeJoin.round
        ..color = Colors.white,
    ),
    displayMedium: TextStyle(
      fontFamily: displayFont,
      fontWeight: FontWeight.w900,
      fontSize: 22,
      color: AppColors.text,
      letterSpacing: 0.35,
      height: 1.27,
    ),
    displaySmall: TextStyle(
      fontFamily: displayFont,
      fontWeight: FontWeight.w900,
      fontSize: 15,
      color: AppColors.text,
      letterSpacing: 0.35,
      height: 1.87,
    ),
    headlineLarge: TextStyle(
      fontFamily: primaryFont,
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color: AppColors.text,
    ),
    headlineMedium: TextStyle(
      fontFamily: primaryFont,
      fontWeight: FontWeight.bold,
      fontSize: 13,
      color: AppColors.text,
    ),
    bodyLarge: TextStyle(
      fontFamily: accentFont,
      fontSize: 13,
      color: AppColors.text,
    ),
    bodyMedium: TextStyle(
      fontFamily: accentFont,
      fontSize: 12,
      color: AppColors.text,
    ),
    labelLarge: TextStyle(
      fontFamily: primaryFont,
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: AppColors.text,
    ),
  );
}
