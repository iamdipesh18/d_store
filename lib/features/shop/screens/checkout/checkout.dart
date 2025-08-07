import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:d_store/common/widgets/products/cart/cart_item.dart';
import 'package:d_store/common/widgets/products/cart/coupon_widget.dart';
import 'package:d_store/common/widgets/success_screen/success_screen.dart';
import 'package:d_store/features/shop/screens/cart/cart_items.dart';
import 'package:d_store/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:d_store/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:d_store/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:d_store/navigation_menu.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      // App bar
      appBar: TAppbar(
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineMedium,
        ),

        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in the Cart
              TCartItems(showAddRemoveButtons: false),
              SizedBox(height: TSizes.spaceBtwSections),

              /// -- Coupon TextField
              TCouponCode(),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                backgroundColor: isDark ? TColors.black : TColors.white,
                padding: const EdgeInsets.all(TSizes.md),
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    /// Payment & Methods
                    TBillingPaymentSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    /// Address
                    TBillingAddressSection(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// -- Bottom Navigation Check Out Button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
          onPressed: () {
            Get.to(
              () => SuccessScreen(
                image: TImage.staticSuccessIllustration,
                title: 'Payment Success!',
                subTitle: 'Your item will be shipped soon',
                onPressed: () => Get.to(() => const NavigationMenu()),
              ),
            );
          },
          child: Text('Checkout \$256.0'),
        ),
      ),
    );
  }
}
