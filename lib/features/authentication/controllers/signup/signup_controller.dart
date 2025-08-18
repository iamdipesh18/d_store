import 'package:d_store/features/authentication/controllers/signup/network_manager.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/popups/full_screen_loader.dart';
import 'package:d_store/utils/popups/loaders.dart';
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
  final hidePassword = true.obs; // Observable for hiding and showing password

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
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Form Validation
      if (!signupFormkey.currentState!.validate()) return;

      // Privacy Policy Check

      // Register User in the Firebase Authentication & Save User data in the Firebase

      // Save Authenticated User Data in firebase firestore

      // Show Success Message

      // Move to verify Screen
    } catch (e) {
      // Show some generic error to the user
      TLoaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    } finally {
      // Remove Loading
      TFullScreenLoader.stopLoading();
    }
  }
}
