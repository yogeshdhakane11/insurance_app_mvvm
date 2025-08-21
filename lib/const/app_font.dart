import 'package:flutter/material.dart';

class AppFont {
  static final regular = TextStyle(
    fontFamily: 'Metro',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: 18,
  );

  static final medium = TextStyle(
    fontFamily: 'Metro',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: 18,
  );

  static final bold = TextStyle(
    fontFamily: 'Metro',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 18,
  );
  static final semiBold = TextStyle(
    fontFamily: 'Metro',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: 18,
  );
}

// flutter:
// fonts:
// - family: Metro
// fonts:
// - asset: assets/fonts/Metro-Regular.ttf
// - asset: assets/fonts/Metro-Medium.ttf
// weight: 500
// - asset: assets/fonts/Metro-Bold.ttf
// weight: 600
// - asset: assets/fonts/Metro-SemiBold.ttf
// weight: 600

// Text(
// 'Regular Text',
// style: AppFont.regular, // Using the regular font style
// ),
// SizedBox(height: 20),
// Text(
// 'Medium Text',
// style: AppFont.medium, // Using the medium font style
// ),
// SizedBox(height: 20),
// Text(
// 'Bold Text',
// style: AppFont.bold, // Using the bold font style
// ),
// SizedBox(height: 20),
// Text(
// 'SemiBold Text',
// style: AppFont.semiBold, // Using the semiBold font style
// ),
