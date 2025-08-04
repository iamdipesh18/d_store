import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    centerTitle: false, // Not in the Center in the app bar
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent, // Background color for the app bar
    elevation: 0, // No shadow for the app bar
    surfaceTintColor: Colors.transparent, // No surface tint color
    iconTheme: IconThemeData(
      color: TColors.black, // Icon color in the app bar
      size: TSizes.iconMd, // Size of the icons in the app bar
    ),
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: TColors.black, // Title text color in the app bar
    ),
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    centerTitle: false, // Center the title in the app bar
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent, // Background color for the app bar
    elevation: 0, // No shadow for the app bar
    surfaceTintColor: Colors.transparent, // No surface tint color
    iconTheme: IconThemeData(
      color: TColors.black, // Icon color in the app bar
      size: TSizes.iconMd, // Size of the icons in the app bar
    ),
    titleTextStyle: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: TColors.white, // Title text color in the app bar
    ),
  );
}
