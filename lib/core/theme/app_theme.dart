import 'package:flutter/material.dart';
import 'custom_colors.dart';

class AppTheme {
  static final dark = ThemeData(
    brightness: Brightness.dark,
    dialogTheme: const DialogThemeData(
      titleTextStyle: TextStyle(color: Colors.white),
      contentTextStyle: TextStyle(color: Colors.white),
      backgroundColor: CustomColors.darkGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(16.0),
        ),
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    fontFamily: 'Poppins',
    scaffoldBackgroundColor: Colors.black,
  );
}
