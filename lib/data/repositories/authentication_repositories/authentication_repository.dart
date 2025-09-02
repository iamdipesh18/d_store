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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Repository responsible for handling all Authentication logic.
/// Uses Firebase Authentication + Google Sign-In + GetX for navigation.
class AuthenticationRepository extends GetxController {
  // Allow global access to this repo using Get.find()
  static AuthenticationRepository get instance => Get.find();

  /// -- Dependencies and Variables
  final deviceStorage = GetStorage(); // Local key-value storage
  final _auth = FirebaseAuth.instance; // Firebase authentication instance

  // ✅ Fix: Define GoogleSignIn here (instead of calling GoogleSignIn() directly every time)
  // final GoogleSignIn _googleSignIn = GoogleSignIn();

  /// -- Called once the controller is ready (after being allocated in memory)
  /// This is triggered from main.dart after app launch
  @override
  void onReady() {
    super.onReady();

    // Remove splash screen after initialization
    FlutterNativeSplash.remove();

    // Delay navigation until after first frame (avoids GetX binding issues)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      screenRedirect();
    });
  }

  /* --------------------------------------------
   * SCREEN REDIRECTION LOGIC  
   * Determines which screen to show after splash
   * -------------------------------------------- */
  void screenRedirect() async {
    final user = _auth.currentUser; // Get the currently logged-in user
    if (user != null) {
      // If user exists
      if (user.emailVerified) {
        // ✅ Email is verified → Go to main app
        Get.offAll(() => const NavigationMenu());
      } else {
        // ❌ Email not verified → Go to verification screen
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
      // If no user is logged in, check if app opened for the first time
      deviceStorage.writeIfNull("isFirstTime", true);

      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(
              () => const LoginScreen(),
            ) // Not first time → Go to Login
          : Get.offAll(
              () => const OnBoardingScreen(),
            ); // First time → Onboarding
    }
  }

  /* ---------------------------------- Email & Password Sign in ----------------------------------------------------------- */
  /// [Email Authentication] - Login user
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
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

  /* ---------------------------------- Email & Password Sign up ------------------------------------------------------------*/
  /// [Email Authentication] - Register user
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

  /// [Email Verification] - Send verification mail
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
  
    /* -------------------------------------- Forget Password ----------------------------------------------------------------*/
  /// [Email Authentication] - Forget Password
    Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
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




  /* ------------------------------- FEDERATED IDENTITY AND SOCIAL SIGN IN -------------------------------------------------- */
  /* ----------------------------------------------- Google Sign in ----------------------------------------------------------*/
  /// [Google Sign-In] - Authenticate user with Google
  // Future<UserCredential?> signInWithGoogle() async {
  //   try {
  //     // Trigger the Google Sign-In flow
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

  //     if (googleUser == null) {
  //       // If user cancels the Google Sign-In popup
  //       return null;
  //     }

  //     // Obtain authentication details
  //     final GoogleSignInAuthentication googleAuth = googleUser.authentication;

  //     // Create a credential for Firebase using the Google tokens
  //     final credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );

  //     // Sign in with Firebase and return the UserCredential
  //     return await _auth.signInWithCredential(credential);
  //   } on FirebaseAuthException catch (e) {
  //     throw TFirebaseAuthExceptions(e.code).message;
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     if (kDebugMode) print("Something went wrong : $e");
  //     return null;
  //   }
  // }

  /* ----------------------------------------------- Facebook Sign in -------------------------------------------------------- */
  /* ------------------------------- FEDERATED IDENTITY AND SOCIAL SIGN IN END ----------------------------------------------- */

  /* ------------------------------------------------- Logout ---------------------------------------------------------------- */
  /// [Logout User] - Works for both Firebase and Google
  Future<void> logout() async {
    try {
      // await _googleSignIn.signOut(); // ✅ Also disconnects Google session
      await _auth.signOut(); // ✅ Sign out from Firebase
      Get.offAll(() => const LoginScreen()); // Redirect to login
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

  /// [Delete User] - To be implemented (removes user from Firebase & Firestore)
}
