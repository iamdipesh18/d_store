import 'package:d_store/common/widgets/loaders/animation_loader.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A utility class to handle fullscreen loading dialogs in the app.
///
/// Features:
/// - Blocks user interaction while loading.
/// - Safe to open/close without risking crashes.
/// - Fully theme-aware (adapts to Dark/Light mode).
class TFullScreenLoader {
  /// Opens a fullscreen blocking loading dialog.
  ///
  /// Parameters:
  /// - [text] → Message shown under the loader animation.
  /// - [animation] → Path to the Lottie animation asset.
  ///
  /// Notes:
  /// - Cannot be dismissed by tapping outside or using the back button.
  /// - Should always be followed by a call to [stopLoading] once the task is complete.
  static void openLoadingDialog(String text, String animation) {
    final overlayContext = Get.overlayContext;
    if (overlayContext == null) {
      return; // Safety: If no overlay, skip showing loader
    }
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context ?? overlayContext)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Center(
            child: TAnimationLoaderWidget(text: text, animation: animation),
          ),
        ),
      ),
    );
  }

  /// Closes the currently open loading dialog.
  ///
  /// Safe to call even if no loader is active.
  /// Example usage:
  /// ```dart
  /// TFullScreenLoader.stopLoading();
  /// ```
  static void stopLoading() {
    final overlayContext = Get.overlayContext;

    if (overlayContext != null && Navigator.of(overlayContext).canPop()) {
      Navigator.of(overlayContext).pop(); // Close the top-most dialog
    }
  }
}
