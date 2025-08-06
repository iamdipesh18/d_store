import 'package:d_store/utils/constants/colors.dart';
import 'package:flutter/material.dart';
class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: TColors.grey.withOpacity(0.4), // Color for disabled chips
    labelStyle: const TextStyle(color: TColors.black), // Text style for chip labels
    selectedColor: TColors.primary, // Color for selected chips
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12), // Padding around the chip content
    checkmarkColor: TColors.white, // Color for the checkmark in selected chips
  );

  static ChipThemeData darkChipTheme =const ChipThemeData(
    disabledColor: TColors.darkerGrey, // Color for disabled chips
    labelStyle: const TextStyle(color: TColors.white), // Text style for chip labels
    selectedColor: TColors.primary, // Color for selected chips
    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12), // Padding around the chip content
    checkmarkColor: TColors.white, // Color for the checkmark in selected chips
  );
}