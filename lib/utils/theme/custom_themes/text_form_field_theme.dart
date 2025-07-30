import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TTextFormFieldTheme {

  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    labelStyle: const TextStyle().copyWith(
      color: TColors.black,
      fontSize: TSizes.fontSizeMd,
    ),
    hintStyle: const TextStyle().copyWith(
      color: TColors.black,
      fontSize: TSizes.fontSizeSm,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TColors.black.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide:const BorderSide(width: 1 , color: TColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide:const BorderSide(width: 1 , color: TColors.grey),
    ),
    focusedBorder: 
    const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1 , color: TColors.dark),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1 , color: TColors.warning),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2 , color: TColors.warning),
    ),

  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: TColors.darkGrey,
    suffixIconColor: TColors.darkGrey,
    labelStyle: const TextStyle().copyWith(
      color: TColors.white,
      fontSize: TSizes.fontSizeMd,
    ),
    hintStyle: const TextStyle().copyWith(
      color: TColors.white,
      fontSize: TSizes.fontSizeSm,
    ),
    errorStyle: const TextStyle().copyWith(
      fontStyle: FontStyle.normal
    ),
    floatingLabelStyle: const TextStyle().copyWith(
      color: TColors.white.withOpacity(0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide:const BorderSide(width: 1 , color: TColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide:const BorderSide(width: 1 , color: Colors.grey),
    ),
    focusedBorder: 
    const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2 , color: Colors.white),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 1 , color: Colors.red),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(14),
      borderSide: const BorderSide(width: 2 , color: Colors.orange),
    ),
  );


}