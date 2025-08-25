import 'package:d_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TTermsAndCondition extends StatelessWidget {
  const TTermsAndCondition({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final darkMode = THelperFunctions.isDarkMode(context);

    // Text styles
    final TextStyle normalStyle = Theme.of(context).textTheme.bodySmall!;
    final TextStyle linkStyle = Theme.of(context).textTheme.bodyMedium!
        .copyWith(
          color: darkMode ? TColors.white : TColors.primary,
          decoration: TextDecoration.underline,
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Checkbox
        SizedBox(
          width: 24,
          height: 24,
          child: Obx(
            () => Checkbox(
              value: controller.privacyPolicy.value,
              onChanged: (value) => controller.privacyPolicy.value =
                  !controller.privacyPolicy.value,
            ),
          ),
        ),

        // Spacing
        const SizedBox(width: TSizes.spaceBtwItems),

        // Rich text with clickable links
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(text: '${TText.iAgreeTo} ', style: normalStyle),
                TextSpan(
                  text: TText.privacyPolicy,
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => debugPrint('Privacy Policy Tapped'),
                ),
                TextSpan(text: ' ${TText.and} ', style: normalStyle),
                TextSpan(
                  text: TText.termsOfUse,
                  style: linkStyle,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => debugPrint('Privacy Policy Tapped'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
