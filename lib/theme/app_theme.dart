import 'package:flutter/material.dart';
import 'package:investment_app/theme/app_colors.dart';
import 'package:investment_app/theme/app_branding_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.shamrock),
      primaryColor: AppColors.shamrock,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.white,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.black,
      ),
      dividerColor: AppColors.silver.withOpacity(0.2),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.white,
        selectedItemColor: AppColors.shamrock,
        unselectedItemColor: AppColors.black,
        selectedIconTheme: IconThemeData(
          color: AppColors.shamrock,
        ),
        selectedLabelStyle: TextStyle(
          color: AppColors.shamrock,
        ),
        unselectedIconTheme: IconThemeData(
          color: AppColors.black,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.black,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: AppColors.silver),
        fillColor: Colors.transparent,
        filled: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.shamrock),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.silver),
        ),
      ),
      textTheme: const TextTheme(
        headlineSmall: TextStyle(
          fontSize: 14,
          color: AppColors.black,
        ),
        headlineMedium: TextStyle(
          fontSize: 16,
          color: AppColors.black,
        ),
        headlineLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w800,
          color: AppColors.black,
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

  static ThemeData get darkTheme {
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: AppColors.codGray,
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.shamrock),
      primaryColor: AppColors.shamrock,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.codGray,
      ),
      iconTheme: const IconThemeData(
        color: AppColors.white,
      ),
      dividerColor: AppColors.silver.withOpacity(0.2),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.codGray,
        selectedItemColor: AppColors.shamrock,
        unselectedItemColor: AppColors.white,
        unselectedIconTheme: IconThemeData(
          color: AppColors.white,
        ),
        unselectedLabelStyle: TextStyle(
          color: AppColors.white,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: AppColors.silver),
        fillColor: Colors.transparent,
        filled: true,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.shamrock),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.silver),
        ),
      ),
      textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontSize: 14,
            color: AppColors.white,
          ),
          headlineMedium: TextStyle(
            fontSize: 16,
            color: AppColors.white,
          ),
          headlineLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: AppColors.white,
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
