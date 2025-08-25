import 'package:d_store/common/widgets/login_signup/form_divider.dart';
import 'package:d_store/common/widgets/login_signup/social_buttons.dart';
import 'package:d_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ---------------------
              // Title Section
              // ---------------------
              Text(
                TText.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              // ---------------------
              // Sign Up Form
              // ---------------------
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),

              // ---------------------
              // Divider
              // ---------------------
              TFormDivider(dividerText: TText.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),

              // ---------------------
              // Social Login Buttons
              // ---------------------
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
