import 'package:flutter/material.dart';
class TChipTheme {
  TChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4), // Color for disabled chips
    labelStyle: const TextStyle(color: Colors.black), // Text style for chip labels
    selectedColor: Colors.blue, // Color for selected chips
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), // Padding around the chip content
    checkmarkColor: Colors.white, // Color for the checkmark in selected chips
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: Colors.grey, // Color for disabled chips
    labelStyle: const TextStyle(color: Colors.white), // Text style for chip labels
    selectedColor: Colors.blue, // Color for selected chips
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12), // Padding around the chip content
    checkmarkColor: Colors.white, // Color for the checkmark in selected chips
  );
}