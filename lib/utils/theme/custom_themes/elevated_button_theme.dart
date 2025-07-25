import 'package:flutter/material.dart';

// Custom elevated button theme for the app
class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.blue, // Primary color for the button
          foregroundColor: Colors.white, // Text color for the button
          disabledBackgroundColor:
              Colors.grey, // Color when the button is disabled
          disabledForegroundColor:
              Colors.grey, // Text color when the button is disabled
          side: const BorderSide(
            color: Colors.blue, // No border for the button
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12, // Vertical padding for the button
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
        ),
      );

  static ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.blue, // Primary color for the button
          foregroundColor: Colors.white, // Text color for the button
          disabledBackgroundColor:
              Colors.grey, // Color when the button is disabled
          disabledForegroundColor:
              Colors.grey, // Text color when the button is disabled
          side: const BorderSide(
            color: Colors.blue, // No border for the button
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 12, // Vertical padding for the button
          ),
          textStyle: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Rounded corners
          ),
        ),
      );
}
