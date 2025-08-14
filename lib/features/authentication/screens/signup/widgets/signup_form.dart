import 'package:d_store/features/authentication/controllers/signup/signup_controller.dart';
import 'package:d_store/features/authentication/screens/signup/verify_email.dart';
import 'package:d_store/features/authentication/screens/signup/widgets/terms_and_condition.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:d_store/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Form(
      key: controller.signupFormkey,
      child: Column(
        children: [
          Row(
            children: [
              // First Name & Last Name
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator:(value)=>TValidator.validateEmptyText('First Name', value) ,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TText.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwinputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator:(value)=>TValidator.validateEmptyText('Last Name', value) ,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TText.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwinputFields),
          // Username
          TextFormField(
            controller: controller.userName,
            validator:(value)=>TValidator.validateEmptyText('Username', value) ,
            expands: false,
            decoration: const InputDecoration(
              labelText: TText.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwinputFields),
          // Email
          TextFormField(
            controller: controller.email,
            validator:(value)=>TValidator.validateEmail(value) ,
            expands: false,
            decoration: const InputDecoration(
              labelText: TText.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwinputFields),
          // Phone Number
          TextFormField(
            controller: controller.phoneNumber,
            validator:(value)=>TValidator.validatePhoneNumber(value) ,
            expands: false,
            decoration: const InputDecoration(
              labelText: TText.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwinputFields),
          // Password
          TextFormField(
            controller: controller.password,
            validator:(value)=>TValidator.validateEmptyText('Password', value) ,
            expands: false,
            decoration: const InputDecoration(
              labelText: TText.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwinputFields),
          // Terms & Conditions Checkbox
          const TTermsAndCondition(),
          const SizedBox(height: TSizes.spaceBtwSections),
          // SignUp Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TText.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
