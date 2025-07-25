import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    centerTitle: true, // Center the title in the app bar
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent, // Background color for the app bar
    elevation: 0, // No shadow for the app bar
    surfaceTintColor: Colors.transparent, // No surface tint color
    iconTheme: IconThemeData(
      color: Colors.black, // Icon color in the app bar
      size: 24, // Size of the icons in the app bar
    ),
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.black, // Title text color in the app bar
    ),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    centerTitle: true, // Center the title in the app bar
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent, // Background color for the app bar
    elevation: 0, // No shadow for the app bar
    surfaceTintColor: Colors.transparent, // No surface tint color
    iconTheme: IconThemeData(
      color: Colors.black, // Icon color in the app bar
      size: 24, // Size of the icons in the app bar
    ),
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.white, // Title text color in the app bar
    ),
  );
}