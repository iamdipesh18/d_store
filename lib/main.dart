import 'package:d_store/app.dart';
import 'package:d_store/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Main entry point of the application.
void main() async {
  // Todo: Add Widgets Binding
  // Todo: Init Local Storage
  // Todo: Native Splash Screen
  // Todo: Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) {
    Get.put(AuthenticationRepository());
  });

  // Todo: Initialize Authentication

  // Load all the Material Designs / themes / Localizations / Bindings
  runApp(const App());
}
