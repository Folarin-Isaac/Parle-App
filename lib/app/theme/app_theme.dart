import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:parle_app/constants/app_colors.dart';
import 'package:parle_app/constants/app_strings.dart';


class AppTheme {
  AppTheme._();

  static const double size0 = 0;
  static const double size4 = 4.0;
  static const double size8 = 8.0;
  static const double size12 = 12.0;
  static const double size16 = 16.0;
  static const double size20 = 20.0;
  static const double size24 = 24.0;
  static const double size32 = 32.0;
  static const double size40 = 40.0;
  static const double size48 = 48.0;
  static const double size56 = 56.0;
  static const double size64 = 64.0;
  static const double size80 = 80.0;

  static const double radius4 = 4.0;
  static const double radius8 = 8.0;
  static const double radius12 = 12.0;
  static const double radius16 = 16.0;
  static const double radius24 = 24.0;
  static const double radius32 = 32.0;

  static const double elevation0 = 0.0;
  static const double elevation2 = 2.0;
  static const double elevation4 = 4.0;
  static const double elevation8 = 8.0;

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    fontFamily: AppStrings.fontFamily,

    colorScheme: const ColorScheme.light(
      primary: AppColors.lightPrimary,
      secondary: AppColors.lightPrimaryDark,
      surface: AppColors.lightBackground,
      error: AppColors.error,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: AppColors.lightTextPrimary,
      onError: Colors.white,
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.lightTextPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.lightTextPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.fontFamily,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.dark,
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.lightCardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius12),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.lightSecondaryBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius8),
        borderSide: const BorderSide(color: AppColors.lightPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius8),
        borderSide: const BorderSide(color: AppColors.error, width: 1),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: size16, vertical: size16),
      hintStyle: const TextStyle(
        color: AppColors.lightTextHint,
        fontFamily: AppStrings.fontFamily,
      ),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightPrimary,
        foregroundColor: Colors.white,
        elevation: elevation0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: size24, vertical: size16),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: AppStrings.fontFamily,
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.lightPrimary,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: AppStrings.fontFamily,
        ),
      ),
    ),

    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(
        color: Color(0xFF555555),
        width: 0.4,
      ),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.checkboxActive;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(Colors.white),
      shape: RoundedRectangleBorder(),
    ),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.lightDivider,
      thickness: 1,
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.lightTextSecondary,
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.lightBackground,
      selectedItemColor: AppColors.lightPrimary,
      unselectedItemColor: AppColors.lightTextSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // Text Theme
    textTheme: const TextTheme(
      // Display styles (largest)
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      displaySmall: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),

      // Headline styles
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),

      // Title styles
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),

      // Body styles
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.lightTextSecondary,
        fontWeight: FontWeight.w400,
        fontFamily: AppStrings.fontFamily,
      ),

      // Label styles
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.lightTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.lightTextSecondary,
        fontFamily: AppStrings.fontFamily,
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.darkPrimary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    fontFamily: AppStrings.fontFamily,

    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkPrimary,
      secondary: AppColors.darkPrimaryDark,
      surface: AppColors.darkSecondaryBackground,
      error: AppColors.errorDark,
      onPrimary: Colors.black,
      onSecondary: Colors.black,
      onSurface: AppColors.darkTextPrimary,
      onError: Colors.black,
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      elevation: 0,
      iconTheme: IconThemeData(color: AppColors.darkTextPrimary),
      titleTextStyle: TextStyle(
        color: AppColors.darkTextPrimary,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontFamily: AppStrings.fontFamily,
      ),
      systemOverlayStyle: SystemUiOverlayStyle.light,
    ),

    // Card Theme
    cardTheme: CardThemeData(
      color: AppColors.darkCardBackground,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius12),
      ),
    ),

    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.darkSecondaryBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius8),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius8),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius8),
        borderSide: const BorderSide(color: AppColors.darkPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radius8),
        borderSide: const BorderSide(color: AppColors.errorDark, width: 1),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: size16, vertical: size16),
      hintStyle: const TextStyle(
        color: AppColors.darkTextHint,
        fontFamily: AppStrings.fontFamily,
      ),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.darkPrimary,
        foregroundColor: Colors.black,
        elevation: elevation0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: size24, vertical: size16),
        textStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          fontFamily: AppStrings.fontFamily,
        ),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.darkPrimary,
        textStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          fontFamily: AppStrings.fontFamily,
        ),
      ),
    ),

    // Checkbox Theme
    checkboxTheme: CheckboxThemeData(
      side: const BorderSide(
        color: Color(0xFF555555),
        width: 0.4,
      ),
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return AppColors.checkboxActive;
        }
        return Colors.transparent;
      }),
      checkColor: WidgetStateProperty.all(Colors.black),
      shape: RoundedRectangleBorder(),
    ),

    // Divider Theme
    dividerTheme: const DividerThemeData(
      color: AppColors.darkDivider,
      thickness: 1,
    ),

    // Icon Theme
    iconTheme: const IconThemeData(
      color: AppColors.darkTextSecondary,
    ),

    // Bottom Navigation Bar Theme
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkSecondaryBackground,
      selectedItemColor: AppColors.darkPrimary,
      unselectedItemColor: AppColors.darkTextSecondary,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),

    // Text Theme
    textTheme: const TextTheme(
      // Display styles
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      displaySmall: TextStyle(
        fontSize: 23,
        fontWeight: FontWeight.bold,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),

      // Headline styles
      headlineMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      headlineSmall: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),

      // Title styles
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      titleMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),

      // Body styles
      bodyLarge: TextStyle(
        fontSize: 16,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.darkTextSecondary,
        fontFamily: AppStrings.fontFamily,
      ),

      // Label styles
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextPrimary,
        fontFamily: AppStrings.fontFamily,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.darkTextSecondary,
        fontFamily: AppStrings.fontFamily,
      ),
    ),
  );
}