import 'package:flutter/material.dart';

class TCheckboxTheme {
  TCheckboxTheme._();
  // Define light and dark themes for checkboxes
  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        4,
      ), // Rounded corners for the checkbox
    ),
    checkColor: MaterialStateProperty.resolveWith((states){
      if (states.contains(MaterialState.selected)) {
        return Colors.white; // Color for the checkmark
      }
      else {
        return Colors.black; // Default color when not selected
      }
    }), // Color for the checkmark
    fillColor: MaterialStateProperty.resolveWith((states){
      if (states.contains(MaterialState.selected)) {
        return Colors.blue; // Color for the checkmark
      }
      else {
        return Colors.transparent; // Default color when not selected
      }
    }), // Color for the checkmark
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        4,
      ), // Rounded corners for the checkbox
    ),
    checkColor: MaterialStateProperty.resolveWith((states){
      if (states.contains(MaterialState.selected)) {
        return Colors.white; // Color for the checkmark
      }
      else {
        return Colors.black; // Default color when not selected
      }
    }), // Color for the checkmark
    fillColor: MaterialStateProperty.resolveWith((states){
      if (states.contains(MaterialState.selected)) {
        return Colors.blue; // Color for the checkmark
      }
      else {
        return Colors.transparent; // Default color when not selected
      }
    }), 
  );
}
