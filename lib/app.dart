import 'package:d_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:d_store/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

/// Use this class to set up themes, initial bindings m any animations, and other app-wide settings.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system, // Use system theme mode
      theme: TAppTheme.lightTheme, // for light theme
      darkTheme: TAppTheme.darkTheme, // for dark theme
      home: const OnBoardingScreen(), // Initial screen
      debugShowCheckedModeBanner: false, // Hide debug banner
    );
  }
}