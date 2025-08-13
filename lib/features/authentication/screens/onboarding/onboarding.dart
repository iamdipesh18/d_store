import 'package:d_store/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:d_store/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:d_store/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:d_store/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:d_store/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = Get.put(OnBoardingController());

  @override
  void initState() {
    super.initState();
    // Pre-cache all GIFs for smooth transitions
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage(TImage.onBoarding1), context);
      precacheImage(const AssetImage(TImage.onBoarding2), context);
      precacheImage(const AssetImage(TImage.onBoarding3), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                // gif: 'assets/images/animations/onboarding1.gif',
                gif: TImage.onBoarding1,
                title: TText.onBoardingTitle1,
                subtitle: TText.onBoardingSubtitle1,
              ),
              OnBoardingPage(
                // gif: 'assets/animations/onboarding2.gif',
                gif: TImage.onBoarding2,
                title: TText.onBoardingTitle2,
                subtitle: TText.onBoardingSubtitle2,
              ),
              OnBoardingPage(
                // gif: 'assets/animations/onboarding3.gif',
                gif: TImage.onBoarding3,
                title: TText.onBoardingTitle3,
                subtitle: TText.onBoardingSubtitle3,
              ),
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNavigation(),
          const OnBoardingNextButton(),
        ],
      ),
    );
  }
}
