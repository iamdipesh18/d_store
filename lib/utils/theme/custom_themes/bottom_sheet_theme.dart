import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();

  static BottomSheetThemeData lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true, // Show drag handle for bottom sheets
    backgroundColor: Colors.white, // Background color for the bottom sheet
    modalBackgroundColor: Colors.white, // Background color for modal bottom sheets
    constraints: const BoxConstraints(
     minWidth: double.infinity, // Full width for the bottom sheet
     ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // Rounded corners
    ),
  );

  static BottomSheetThemeData darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true, // Show drag handle for bottom sheets
    backgroundColor: Colors.black, // Background color for the bottom sheet
    modalBackgroundColor: Colors.black, // Background color for modal bottom sheets
    constraints: const BoxConstraints(
     minWidth: double.infinity, // Full width for the bottom sheet
     ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)), // Rounded corners
    ),
  );
}