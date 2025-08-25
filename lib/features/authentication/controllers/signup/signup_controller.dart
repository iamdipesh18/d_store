import 'package:d_store/data/repositories/authentication_repositories/authentication_repository.dart';
import 'package:d_store/data/user/user_model.dart';
import 'package:d_store/data/user/user_repository.dart';
import 'package:d_store/features/authentication/controllers/signup/network_manager.dart';
import 'package:d_store/features/authentication/screens/signup/verify_email.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/popups/full_screen_loader.dart';
import 'package:d_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// -- Variables
  final email = TextEditingController(); // Controller for email input
  final lastName = TextEditingController(); // Controller for last name input
  final username = TextEditingController(); // Controller for username input
  final password = TextEditingController(); // Controller for password input
  final firstName = TextEditingController(); // Controller for first name input
  final phoneNumber =
      TextEditingController(); // Controller for phone number input

  final hidePassword = true.obs; // Observable for hiding/showing password
  final privacyPolicy = true.obs; // Observable for privacy policy acceptance

  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form Key For Form Validation

  /// -- Signup
  signup() async {
    try {
      /// -- Start Loading
      TFullScreenLoader.openLoadingDialog(
        "We are processing your information",
        TImage.onBoarding3,
      );

      /// -- Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// -- Form Validation
      if (!signupFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// -- Privacy Policy Check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: "Accpet Privacy Policy",
          message:
              "In order to create an account, you must have to read and accept the Privacy Policy & Terms of Use",
        );
        return;
      }

      /// -- Register User in the Firebase Aythentication & Save User data in the firebase
      final UserCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      /// -- Save Authenticated used data in the ifrebase firestore
      final newUser = UserModel(
        id: UserCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );
      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      TFullScreenLoader.stopLoading();

      /// -- Show the success message
      TLoaders.successSnackBar(
        title: "Congratulations",
        message: "Your account has been created! Verify email to continue.",
      );

      /// -- Move to Verify Email Screen
      Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));
    } catch (e) {
      /// -- Remove Loader
      TFullScreenLoader.stopLoading();

      /// -- Show some Generic Error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
