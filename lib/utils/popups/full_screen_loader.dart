import 'package:d_store/common/widgets/loaders/animation_loader.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  // Open a full screen loading dialog with a given text and animation
  // This method doesnot return anything

  // Parameters
  // text : The text to be displayed in the loading dialog
  // animation : The lottie animation to be shown

  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunctions.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(
                text: text,
                animation: animation,
                showAction: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Stop the currently opened loading dialog
  // THis method doesnot return anything

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using navigator
  }
}
