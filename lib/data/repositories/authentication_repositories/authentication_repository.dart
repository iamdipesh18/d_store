import 'dart:async';
import 'package:d_store/features/authentication/screens/login/login.dart';
import 'package:d_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:d_store/features/authentication/screens/signup/verify_email.dart';
import 'package:d_store/navigation_menu.dart';
import 'package:d_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:d_store/utils/exceptions/firebase_exception.dart';
import 'package:d_store/utils/exceptions/format_exception.dart';
import 'package:d_store/utils/exceptions/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Repository responsible for handling all Authentication logic.
/// Uses Firebase Authentication and integrates with GetX for navigation.
class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// -- Dependencies and Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// -- Called once the controller is ready (after being allocated in memory)
  /// -- Called from the main.dart on app launch
  @override
  void onReady() {
    super.onReady();

    // Remove splash screen
    FlutterNativeSplash.remove();

    // Delay navigation until after first frame (prevents binding issues)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenRedirect();
    });
  }

  /* --------------------------------------------
   * SCREEN REDIRECTION LOGIC  [Function to show relevant screen]
   * -------------------------------------------- */
  void screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // LocalStorage
      deviceStorage.writeIfNull("isFirstTime", true);
      // Check if its the first time launching the app
      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(
              () => const LoginScreen(),
            ) // Redirect to Login Screen if not the first time
          : Get.offAll(
              () => const OnBoardingScreen(),
            ); // Redirect to Onboarding Screen if its the first time
    }
  }

  /* ---------------------------------- Email & Password Sign in ------------------------------------------------- */
  /// [Email Authentication] - SignIn
  // Future<UserCredential> loginWithEmailAndPassword(
  //   String email,
  //   String password,
  // ) async {
  //   try {
  //     return await _auth.signInWithEmailAndPassword(
  //       email: email,
  //       password: password,
  //     );
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthExceptions(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     throw "Something went wrong , Please try again";
  //   }
  // }
  Future<User?> loginWithEmailAndPassword(String email, String password) async {
  try {
    final credential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print("Credential: ${credential.user}");
    return credential.user;
  } on FirebaseAuthException catch (e) {
    print("FirebaseAuthException: $e");
    rethrow;
  }
}

  /// [Email Authentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong , Please try again";
    }
  }

  /// [Email Verification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong , Please try again";
    }
  }

  /// ReAuthenticate - ReAuthenticate User
  /// [Emaill Authentication] - Forget Password
  /* ------------------------------- End Federated Identity & Social Sign in -------------------------------------- */
  /// [Logout User] - Valid for any authentication
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong , Please try again";
    }
  }

  /// [Delete User] - Remove User Auth and Firestore Account
}
