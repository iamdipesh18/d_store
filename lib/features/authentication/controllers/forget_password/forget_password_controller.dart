import 'package:d_store/data/repositories/authentication_repositories/authentication_repository.dart';
import 'package:d_store/features/authentication/controllers/signup/network_manager.dart';
import 'package:d_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/popups/full_screen_loader.dart';
import 'package:d_store/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  // Variables to store email and password
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send password reset email
  void sendPasswordResetEmail() async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        "Processing Your Request",
        TImage.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Password Reset Email
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      // Stop Loading
      TFullScreenLoader.stopLoading();

      // Show success Screen
      TLoaders.successSnackBar(
        title: "Email Sent",
        message: "Email Link Sent to Reset Your Password.".tr,
      );

      // Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {
      // Stop Loading
      TFullScreenLoader.stopLoading();
      // Show error message
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  void resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        "Processing Your Request",
        TImage.docerAnimation,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);

      // Stop Loading
      TFullScreenLoader.stopLoading();

      // Show success Screen
      TLoaders.successSnackBar(
        title: "Email Sent",
        message: "Email Link Sent to Reset Your Password.".tr,
      );

    } catch (e) {
      // Stop Loading
      TFullScreenLoader.stopLoading();
      // Show error message
      TLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }
}
