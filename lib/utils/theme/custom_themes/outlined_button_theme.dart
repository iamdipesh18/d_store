import 'package:flutter/material.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static OutlinedButtonThemeData lightOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0, // No elevation for the button
          foregroundColor: Colors.black, // Text color
          side: const BorderSide(
            color: Colors.black,
            width: 1.5,
          ), // Border color and width
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ), // Text style for the button
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ), // Padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14), // Rounded corners
          ),
        ),
      );

  static OutlinedButtonThemeData darkOutlinedButtonTheme =
      OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          elevation: 0, // No elevation for the button
          foregroundColor: Colors.white, // Text color
          side: const BorderSide(
            color: Colors.white,
            width: 1.5,
          ), // Border color and width
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ), // Text style for the button
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 20,
          ), // Padding
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14), // Rounded corners
          ),
        ),
      );
}
