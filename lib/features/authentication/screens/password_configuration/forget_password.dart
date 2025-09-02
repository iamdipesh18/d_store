import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:d_store/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:d_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: TAppbar(showBackArrow: true),
      body: Padding(
        padding: EdgeInsetsGeometry.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Headings
            Text(
              TText.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TText.forgetPasswordSubtitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems * 2),
            // Text Fields
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: TText.email,
                ),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                // onPressed: () => Get.off(() => controller.sendPasswordResetEmail()),
                onPressed: () => controller.sendPasswordResetEmail(),

                child: Text(TText.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
