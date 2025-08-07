import 'package:d_store/common/widgets/products/cart/cart_item.dart';
import 'package:d_store/common/widgets/texts/product_price_text.dart';
import 'package:d_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          // Cart Items
          TCartItem(),
          if (showAddRemoveButtons == true)
            const SizedBox(height: TSizes.spaceBtwItems),
          // Add Remove Button with total price
          if (showAddRemoveButtons == true)
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
    );
  }
}
