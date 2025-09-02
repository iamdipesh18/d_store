import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/features/shop/screens/cart/cart_items.dart';
import 'package:d_store/features/shop/screens/checkout/checkout.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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

        /// -- Items in the cart
        child: TCartItems(),
      ),

      /// -- Bottom Navigation Check Out Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            debugPrint("Checkout Button Pressed");
            Get.to(()=>const CheckoutScreen());
          },
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
