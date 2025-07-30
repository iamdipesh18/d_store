import 'package:d_store/common/styles/spacing_styles.dart';
import 'package:d_store/common/widgets/login_signup/form_divider.dart';
import 'package:d_store/features/authentication/screens/login/widgets/login_form.dart';
import 'package:d_store/features/authentication/screens/login/widgets/login_header.dart';
import 'package:d_store/common/widgets/login_signup/social_buttons.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              // Logo , Title , Subtitle
              TLoginHeader(),
              //Form
              const TLoginForm(),
              // Divider
              TFormDivider(dividerText: TText.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              // Footer
              TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
