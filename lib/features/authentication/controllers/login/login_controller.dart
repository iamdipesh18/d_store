import 'package:d_store/data/repositories/authentication_repositories/authentication_repository.dart';
import 'package:d_store/features/authentication/controllers/signup/network_manager.dart';
import 'package:d_store/features/personalization/controllers/user_controller.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/popups/full_screen_loader.dart';
import 'package:d_store/utils/popups/loaders.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  /// -- Dependencies and Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // Load saved credentials if "Remember Me" was checked
    email.text = localStorage.read("REMEMBER_ME_EMAIL")?.toString() ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD")?.toString() ?? "";

    super.onInit();
  }

  /// -- Email & Password Login
  Future<void> emailAndPasswordSignin() async {
  
    try {
      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        "Logging you in ...",
        TImage.docerAnimation,
      );

      /// -- Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// -- Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        TFullScreenLoader.stopLoading();
        return;
      }

      /// -- Save data if remember me is checked
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      /// -- Login User using Email & Password Authentication
      final UserCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      /// -- Remove Loader
      TFullScreenLoader.stopLoading();

      /// -- Redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      /// -- Remove Loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    }
  }

  // Google Sign-In
  // Future<void> googleSignIn() async {
  //   try {
  //     // Start Loading
  //     TFullScreenLoader.openLoadingDialog(
  //       "Logging you in ...",
  //       TImage.docerAnimation,
  //     );

  //     /// -- Check Internet Connectivity
  //     final isConnected = await NetworkManager.instance.isConnected();
  //     if (!isConnected) {
  //       // Remove Loader
  //       TFullScreenLoader.stopLoading();
  //       return;
  //     }

  //     /// -- Google Authentication
  //     final userCredentials =
  //         await AuthenticationRepository.instance.signInWithGoogle();

  //     /// -- Save User Record to Firestore
  //     await userController.saveUserRecord(userCredentials);

  //     /// -- Remove Loader
  //     TFullScreenLoader.stopLoading();

  //     /// -- Redirect
  //     AuthenticationRepository.instance.screenRedirect();
  //   } catch (e) {
  //     /// -- Remove Loader
  //     TFullScreenLoader.stopLoading();
  //     TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
  //   }
  // }
}
