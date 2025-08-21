import 'package:flutter/material.dart';

import '../const/app_colors.dart';

ThemeData lightTheme() {
  return ThemeData(
    useMaterial3: true,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.primary,
      onPrimary: AppColors.onPrimary,
      secondary: AppColors.secondary,
      onSecondary: AppColors.onSecondary,
      surface: AppColors.surface,
      onSurface: AppColors.onBackground,
      background: AppColors.background,
      onBackground: AppColors.onBackground,
      error: AppColors.error,
      onError: Colors.white,
    ),
    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface, // White AppBar
      foregroundColor: AppColors.onBackground, // Black text/icons
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.onBackground,
      ),
      elevation: 0, // Flat design
      centerTitle: true,
    ),
    // ElevatedButton Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary, // Purple buttons
        foregroundColor: AppColors.onPrimary, // White text/icons
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
    // TextButton Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary, // Purple text
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 16),
      ),
    ),
    // checkbox theme
    checkboxTheme: const CheckboxThemeData(
      fillColor: MaterialStatePropertyAll<Color>(Colors.white),
    ),
    // Text Theme (enhanced from your original)
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.primary, // Customize color for headline1
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
      titleLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.onBackground,
        decoration: TextDecoration.none,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: AppColors.onBackground,
        decoration: TextDecoration.none,
      ),
    ),
    scaffoldBackgroundColor: AppColors.background, // Light grey background
    // Input Decoration Theme (Customizing TextFormField Borders)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          // blue
          color: AppColors.primary, // Border color
          width: 1, // Border width
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.blue, // Focused border color
          width: 1.4, // Focused border width
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.grey, // Normal state border color
          width: 1, // Normal state border width
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.error, // Error state border color
          width: 1, // Error state border width
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(
          color: AppColors.error, // Focused error state border color
          width: 1, // Focused error state border width
        ),
      ),
    ),
  );
}

// Text(
// 'Welcome to Insurance App',
// style: Theme.of(context).textTheme.titleLarge, // Bold, black, 20px
// ),
// ElevatedButton(
// onPressed: () {},
// style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
// child: const Text('Click Me'),
// ),
// TextButton(
// onPressed: () {},
// style: TextButton.styleFrom(foregroundColor: Colors.red),
// child: const Text('Cancel'),
// ),
