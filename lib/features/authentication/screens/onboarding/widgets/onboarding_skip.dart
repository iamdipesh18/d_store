import 'package:d_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

// OnBoarding Skip Button Widget
class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}
