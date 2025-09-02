import 'package:d_store/features/authentication/controllers/login/login_controller.dart';
import 'package:d_store/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:d_store/features/authentication/screens/signup/signup.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:d_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey, // move the key here
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        // key: controller.loginFormKey, // ← Add this
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TText.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwinputFields / 2),

            /// --------------------------------------------------------
            /// Password Field with Obx() reactive binding
            /// - Hides/Shows password dynamically
            /// --------------------------------------------------------
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) =>
                    TValidator.validatePassword('Password', value),
                obscureText: controller
                    .hidePassword
                    .value, // Reactively changes when toggled
                decoration: InputDecoration(
                  labelText: TText.password,
                  prefixIcon: const Icon(Iconsax.password_check),

                  // Suffix icon toggles visibility
                  suffixIcon: IconButton(
                    onPressed: () => controller.hidePassword.value =
                        !controller.hidePassword.value,
                    icon: Icon(
                      controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwinputFields / 2),
            // Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Obx(
                  () => Checkbox(
                    value: controller.rememberMe.value,
                    onChanged: (value)=> controller.rememberMe.value = !controller.rememberMe.value,
                  ),
                ),
                const Text(TText.rememberMe),

                // Forget Password
                TextButton(
                  onPressed: () => Get.to(() => const ForgetPassword()),
                  child: const Text(TText.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwinputFields / 2),
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.emailAndPasswordSignin(),
                child: Text(TText.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: Text(TText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
