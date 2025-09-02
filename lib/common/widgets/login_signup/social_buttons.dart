import 'package:d_store/construction.dart';
import 'package:d_store/features/authentication/controllers/login/login_controller.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Google Button
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            // onPressed: ()=> controller.googleSignIn(),
            // onPressed: () {
            //   debugPrint("Google Sign-In Clicked");
            //   const UnderConstructionScreen();
            // },
            onPressed: ()=> const UnderConstructionScreen(),
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImage.google),
            ),
          ),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        // Facebook Button
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100),
          ),
          child: IconButton(
            onPressed: () {
              debugPrint("Facebook Sign-in Clicked");
              const UnderConstructionScreen();
            },
            icon: const Image(
              width: TSizes.iconMd,
              height: TSizes.iconMd,
              image: AssetImage(TImage.facebook),
            ),
          ),
        ),
      ],
    );
  }
}
