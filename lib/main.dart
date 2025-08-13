import 'package:d_store/app.dart';
import 'package:d_store/data/repositories/authentication_repositories/authentication_repository.dart';
import 'package:d_store/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

/// Main entry point of the application.
void main() async {
  /// -- Add Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// -- Init Local Storage
  await GetStorage.init();

  /// -- Await Native Splash Screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  
  // Todo: Initialize Authentication

  // Load all the Material Designs / themes / Localizations / Bindings
  runApp(const App());
}
