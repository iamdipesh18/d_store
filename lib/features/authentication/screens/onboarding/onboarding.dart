import 'package:d_store/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:d_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:d_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:d_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:d_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    
    return Scaffold(
      body: Stack(
        // Horizontal Scrollable PageView with Dots Indicator
        children: [
          // PageView for Onboarding Screens
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImage.onBoarding1,
                title: TText.onBoardingTitle1,
                subtitle: TText.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                image: TImage.onBoarding2,
                title: TText.onBoardingTitle2,
                subtitle: TText.onBoardingSubtitle2,
              ),
              OnBoardingPage(
                image: TImage.onBoarding3,
                title: TText.onBoardingTitle3,
                subtitle: TText.onBoardingSubtitle3,
              ),
            ],
          ),
          // Skip Button
          const OnBoardingSkip(),
          // Dot Navigation Smooth Page Indicator
          const OnBoardingDotNavigation(),
          // Circular Button
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
