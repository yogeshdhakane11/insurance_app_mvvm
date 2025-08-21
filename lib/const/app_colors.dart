import 'package:flutter/material.dart';

class AppColors {
  // Light mode colors
  // static const Color primary = Color(0xFF6200EA); // For buttons, accents
  static const Color primary = Colors.blue;
  static const Color secondary = Color(0xFF03DAC6); // For secondary elements
  static const Color background = Color(0xFFF5F5F5); // Scaffold background
  static const Color surface = Colors.white; // AppBar, cards
  static const Color onPrimary = Colors.white; // Text/icons on primary
  static const Color onSecondary = Colors.black; // Text/icons on secondary
  static const Color onBackground = Colors.black87; // Text/icons on background
  static const Color error = Colors.red; // Error states
  static const Color blue = Colors.blue; // Text/icons on primary
  static const Color green = Colors.green; // Text/icons on primary
  static const Color grey = Colors.grey; // Text/icons on primary

  // Dark mode colors
  static const Color primaryDark = Color(0xFFBB86FC);
  static const Color secondaryDark = Color(0xFF03DAC6);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceDark = Color(0xFF1E1E1E);
  static const Color onPrimaryDark = Colors.black;
  static const Color onSecondaryDark = Colors.black;
  static const Color onBackgroundDark = Colors.white;
  static const Color errorDark = Color(0xFFCF6679);
}

// Text(
// 'Welcome to Flutter!',
// style: TextStyle(
// color: AppColors.textColor,  // Using text color
// fontSize: 24,
// ),
// ),
// SizedBox(height: 20),
// Text(
// 'This is a subtitle',
// style: TextStyle(
// color: AppColors.subtitleColor,  // Using subtitle color
// fontSize: 18,
// ),
// ),
// SizedBox(height: 40),
// ElevatedButton(
// onPressed: () {},
// style: ElevatedButton.styleFrom(
// primary: AppColors.secondaryColor,  // Using secondary color for button
// onPrimary: AppColors.textColor,  // Using text color for button text
// ),
// child: Text('Click Me'),
// ),
// SizedBox(height: 20),
// Container(
// width: double.infinity,
// height: 1,
// color: AppColors.borderColor,  // Using border color
// ),
