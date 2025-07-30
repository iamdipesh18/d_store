import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
        child: Column(
          children: [
            // Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: TText.email,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwinputFields / 2),
            // Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: TText.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwinputFields / 2),
            // Remember Me and Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Remember Me
                Checkbox(value: true, onChanged: (value) {}),
                const Text(TText.rememberMe),

                // Forget Password
                TextButton(
                  onPressed: () {},
                  child: const Text(TText.forgetPassword),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwinputFields / 2),
            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(TText.signIn),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            // Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: Text(TText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
