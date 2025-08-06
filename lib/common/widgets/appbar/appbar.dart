import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/device/device_utility.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TAppbar extends StatelessWidget implements PreferredSizeWidget {
  const TAppbar({
    super.key,
    this.title,
    this.showBackArrow = false,
    this.leadingIcon,
    this.leadingOnpressed,
    this.actions,
  });

  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnpressed;

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        automaticallyImplyLeading: false, // Prevent default back button
        // Leading icon logic
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(
                  Iconsax.arrow_left,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                ),
              )
            : leadingIcon != null
            ? IconButton(onPressed: leadingOnpressed, icon: Icon(leadingIcon))
            : null,
        title: title, // Title from outside (e.g., THomeAppBar)
        actions: actions, // Optional action widgets (e.g., cart icon)
        // // Optional styling (optional)
        // backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        // elevation: Theme.of(context).appBarTheme.elevation ?? 0,
        //iconTheme:isDark? TColors.white : TColors.black ,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight()); // Keeps your custom app bar height
}
