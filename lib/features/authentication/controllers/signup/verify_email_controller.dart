import 'dart:async';
import 'package:d_store/common/widgets/success_screen/success_screen.dart';
import 'package:d_store/data/repositories/authentication_repositories/authentication_repository.dart';
import 'package:d_store/data/user/user_model.dart';
import 'package:d_store/data/user/user_repository.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:d_store/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  // Send Email whenever Verify Email Screen appears & Set TImer for Auto Redirect

  Timer? _timer;
  bool canResend = true; // Controls resend email availability
  bool _hasNavigated = false; // Prevents multiple navigations

  @override
  void onInit() {
    sendEmailVerification(); // Send verification on screen load
    setTimerForAutoRedirect(); // Start periodic check for verification
    super.onInit();
  }

  /// Send Email Verification Link
  void sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
        title: "Email Sent",
        message: "Please check your inbox and verify your email.",
      );
    } catch (e) {
      canResend = true; // allow retry if failed
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // /// Start periodic timer to auto-check email verification
  // void setTimerForAutoRedirect() {


  //   Timer.periodic(const Duration(seconds: 5), (timer) async {
  //   await FirebaseAuth.instance.currentUser?.reload();
  //   final user = FirebaseAuth.instance.currentUser;
  //   if (user?.emailVerified ?? false) {
  //     _timer?.cancel();
  //     Get.off(
  //       () => SuccessScreen(
  //         image: TImage.verifyIllustration,
  //         title: TText.yourAccountCreatedTitle,
  //         subTitle: TText.yourAccountCreatedSubtitle,
  //         onPressed: () => AuthenticationRepository.instance.screenRedirect(),
  //       ),
  //     );
  //   }
  //   });



  // }
  void setTimerForAutoRedirect() {
  _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        _timer?.cancel();
        if (!_hasNavigated) {
          _hasNavigated = true;
          Get.off(
            () => SuccessScreen(
              image: TImage.verifyIllustration,
              title: TText.yourAccountCreatedTitle,
              subTitle: TText.yourAccountCreatedSubtitle,
              onPressed: () => AuthenticationRepository.instance.screenRedirect(),
            ),
          );
        }
      }
    } catch (e) {
      debugPrint("Reload failed: $e"); // prevent crash on network errors
    }
  });
}

@override
void onClose() {
  _timer?.cancel();
  super.onClose();
}


  /// Manual check if email is verified
  void checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: TImage.verifyIllustration,
          title: TText.yourAccountCreatedTitle,
          subTitle: TText.yourAccountCreatedSubtitle,
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
