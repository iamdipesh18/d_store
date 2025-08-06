import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/images/t_circular_image.dart';
import 'package:d_store/common/widgets/texts/section_heading.dart';
import 'package:d_store/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: TAppbar(showBackArrow: true, title: Text("Profile"),),

      /// -- Body
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// -- Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const TCircularImage(
                    image: TImage.user,
                    width: 80,
                    height: 80,
                  ),
                  TextButton(
                    onPressed: () {
                      debugPrint("Change Profile Picture Button Pressed");
                    },
                    child: const Text("Change Profile Picture"),
                  ),
                ],
              ),
            ),

            /// -- Details
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// -- Heading Profile Information
            const TSectionHeading(
              title: "Profile Information",
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(
              onPressed: () {
                debugPrint("Name Pressed");
              },
              value: 'Dipesh Dhungana',
              title: 'Name',
            ),

            TProfileMenu(
              onPressed: () {
                debugPrint("User Name Pressed");
              },
              value: 'iamdipesh18',
              title: 'Username',
            ),

            const SizedBox(height: TSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// -- Heading Personal Information
            const TSectionHeading(
              title: "Personal Information",
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            TProfileMenu(
              onPressed: () {
                debugPrint("User ID Pressed");
              },
              value: '45689',
              title: 'User ID',
              icon: Iconsax.copy,
            ),

            TProfileMenu(
              onPressed: () {
                debugPrint("E-Mail Pressed");
              },
              value: 'dipeshdhungana17@gmail.com',
              title: 'E-mail',
            ),
            TProfileMenu(
              onPressed: () {
                debugPrint("Phone Number Pressed");
              },
              value: '+977 9812345678',
              title: 'Phone Number',
            ),
            TProfileMenu(
              onPressed: () {
                debugPrint("Gender Pressed");
              },
              value: 'Male',
              title: 'Gender',
            ),
            TProfileMenu(
              onPressed: () {
                debugPrint("Date of Birth Pressed");
              },
              value: 'Aug 18, 2002',
              title: 'Date of Birth',
            ),

            const Divider(),
            const SizedBox(height: TSizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () {
                  debugPrint("Close Account Presssed");
                },
                child: Text(
                  "Close Account",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
