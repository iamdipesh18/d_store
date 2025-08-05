import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/icons/t_circular_icon.dart';
import 'package:d_store/common/widgets/layouts/grid_layout.dart';
import 'package:d_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:d_store/features/shop/screens/home/home.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      /// -- Custom App Bar
      appBar: TAppbar(
        title: Text(
          "Wishlist",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            color: isDark ? TColors.white : TColors.dark,
            // onPressed: () => Get.to(const HomeScreen()),
            onPressed: () {
              debugPrint("Add Button Pressed in Wishlist");
            },
          ),
        ],
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          /// -- Products Grid
          child: TGridLayout(
            itemCount: 6,
            itembuilder: (_, index) => const TProductCardVertical(),
          ),
        ),
      ),
    );
  }
}
