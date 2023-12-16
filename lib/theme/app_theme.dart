import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_colors.dart';
import 'package:investment_app/theme/app_branding_colors.dart';

class AppTheme {
  static const Color splashBackground = AppColors.splashBackground;

  static ThemeData get lightTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.shamrock),
      primaryColor: AppColors.shamrock,
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 14,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
        )
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.shamrock,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
            side: const BorderSide(color: AppColors.white, width: 1)
          ),
          // padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        ),
      ),
      useMaterial3: true,
    ).copyWith(
        extensions: <ThemeExtension<dynamic>>[
          const AppBrandingColors(
            color: AppColors.shamrock,
          ),
        ]
    );
  }
}