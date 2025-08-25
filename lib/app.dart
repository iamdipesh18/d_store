import 'package:d_store/bindings/general_bindings.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Root App Widget: sets up themes, bindings, and app-wide settings.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // Theming
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,

      // Global dependencies
      initialBinding: GeneralBindings(),

      // Loader while AuthenticationRepository decides navigation
      home: const Scaffold(
        backgroundColor: TColors.primary,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
