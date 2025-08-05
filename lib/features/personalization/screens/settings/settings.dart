import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:d_store/common/widgets/images/t_circular_image.dart';
import 'package:d_store/common/widgets/list_tile/user_profile_tile.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                /// -- Appbar
                  TAppbar(
                    title: Text(
                      "Account",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium!.apply(color: TColors.white),
                    ),
                  ),
                  /// -- User Profile Card
                  const TUserProfileTile(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
          ],
        ),
      ),
    );
  }
}
