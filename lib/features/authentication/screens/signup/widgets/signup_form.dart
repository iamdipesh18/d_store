import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

// Importing necessary project files
import 'package:d_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:d_store/features/authentication/screens/signup/widgets/terms_and_condition.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:d_store/utils/validators/validation.dart';

/// ------------------------------------------------------------
/// Signup Form Widget
/// ------------------------------------------------------------
/// This widget builds the full Signup Form, including:
/// - First Name & Last Name fields
/// - Username field
/// - Email field
/// - Phone Number field
/// - Password field (with show/hide toggle)
/// - Terms and Conditions checkbox
/// - Signup button
///
/// It uses the SignUpController for state management.
/// ------------------------------------------------------------
class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    // Inject the SignUpController using GetX
    // - Get.put() creates and stores the controller instance
    // - It will be available throughout the widget tree
    final controller = Get.put(SignupController());

    return Form(
      // The form key is used for validation & saving form state
      key: controller.signupFormKey,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align fields to start
        children: [
          /// --------------------------------------------------------
          /// First Name & Last Name (side by side)
          /// --------------------------------------------------------
          Row(
            children: [
              // First Name Input Field
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptyText('First Name', value),
                  decoration: const InputDecoration(
                    labelText: TText.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),

              const SizedBox(width: TSizes.spaceBtwinputFields),

              // Last Name Input Field
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) =>
                      TValidator.validateEmptyText('Last Name', value),
                  decoration: const InputDecoration(
                    labelText: TText.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: TSizes.spaceBtwinputFields),

          /// --------------------------------------------------------
          /// Username Field
          /// --------------------------------------------------------
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                TValidator.validateEmptyText('Username', value),
            decoration: const InputDecoration(
              labelText: TText.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwinputFields),

          /// --------------------------------------------------------
          /// Email Field
          /// --------------------------------------------------------
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            keyboardType: TextInputType.emailAddress, // Better UX
            decoration: const InputDecoration(
              labelText: TText.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwinputFields),

          /// --------------------------------------------------------
          /// Phone Number Field
          /// --------------------------------------------------------
          TextFormField(
            controller: controller.phoneNumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: TText.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),

          const SizedBox(height: TSizes.spaceBtwinputFields),

          /// --------------------------------------------------------
          /// Password Field with Obx() reactive binding
          /// - Hides/Shows password dynamically
          /// --------------------------------------------------------
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) =>
                  TValidator.validateEmptyText('Password', value),
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

          const SizedBox(height: TSizes.spaceBtwinputFields),

          /// --------------------------------------------------------
          /// Terms & Conditions Checkbox
          /// --------------------------------------------------------
          const TTermsAndCondition(),

          const SizedBox(height: TSizes.spaceBtwSections),

          /// --------------------------------------------------------
          /// Sign Up Button
          /// - Calls controller.signup() on press
          /// --------------------------------------------------------
          SizedBox(
            width: double.infinity, // Button takes full width
            child: ElevatedButton(
              onPressed: () {
                // Validate form before calling signup
                controller.signup();
              },
              child: const Text(TText.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
