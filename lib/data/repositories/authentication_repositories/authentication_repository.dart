import 'package:d_store/features/authentication/screens/login/login.dart';
import 'package:d_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// -- Variables
  final deviceStorage = GetStorage();

  /// -- Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  /// -- Function to Show Relevant Screen
  screenRedirect() async {
    if (kDebugMode) {
      print('======================== GET STORAGE AUTH REPO ==========================');
      print(deviceStorage.read('isFirstTime'));
    }

    // Local Storage
    deviceStorage.writeIfNull("isFirstTime", true);
    deviceStorage.read("isFirstTime") != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /*---------- Email & Password Sign-In ------------*/
  /// -- Email Authentication - Sign In
  /// -- Email Authentication - Sign Uo
  /// -- Re Authentication - Re Authenticate User
  /// -- Email Verification - Mail Verification
  /// -- Email Authentication - Forget Password
}
