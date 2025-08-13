import 'package:d_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/device/device_utility.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark
              ? TColors.primary
              : Colors.black, // Button color
          side: BorderSide(
            color: dark ? TColors.primary : Colors.black,
            width: 2, // optional
          ),
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
