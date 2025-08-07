import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/icons/t_circular_icon.dart';
import 'package:d_store/common/widgets/images/t_rounded_image.dart';
import 'package:d_store/common/widgets/products/cart/cart_item.dart';
import 'package:d_store/common/widgets/texts/product_price_text.dart';
import 'package:d_store/common/widgets/texts/product_title_text.dart';
import 'package:d_store/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:d_store/features/shop/screens/cart/add_remove_button.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      // App bar
      appBar: TAppbar(
        title: Text('Cart', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
          shrinkWrap: true,
      
          separatorBuilder: (_, __) =>
              const SizedBox(height: TSizes.spaceBtwSections),
          itemCount: 10,
          itemBuilder: (_, index) => Column(
            children: [
              TCartItem(),
              SizedBox(height: TSizes.spaceBtwItems),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      //Extra Space
                      const SizedBox(width: 70),
                      // Add and Remove Button with Center Counter
                      const TProductQuantityWithAddAndRemoveButton(),
                    ],
                  ),
      
                  TProductPriceText(price: '256'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            debugPrint("Checkout Button Pressed");
          },
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
