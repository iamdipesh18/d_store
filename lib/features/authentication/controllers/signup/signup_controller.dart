import 'package:d_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  // -- Variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final email = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  // -- Sign UP
  Future<void> signup() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'We are processing your information...',
        TImage.onBoarding1,
      );

      // Check Internet Connectivity

      // Form Validation

      // Privacy Policy Check

      // Register User in the Firebase Authentication & Save User data in the Firebase

      // Save Authenticated User Data in firebase firestore

      // Show Success Message

      // Move to verify Screen
    } catch (e) {
      // Show sme generic error to the user
    } finally {
      // Remove Loading
    }
  }
}
