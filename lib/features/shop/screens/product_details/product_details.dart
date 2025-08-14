import 'package:d_store/common/widgets/texts/section_heading.dart';
import 'package:d_store/features/shop/screens/checkout/checkout.dart';
import 'package:d_store/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:d_store/features/shop/screens/product_details/widgets/product_attributes.dart';
import 'package:d_store/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:d_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:d_store/features/shop/screens/product_details/widgets/ratings_and_share_widget.dart';
import 'package:d_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Product Image and Product Image Slider
            TProductImageSlider(),

            /// -- Product Details
            Padding(
              padding: const EdgeInsetsGeometry.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  /// -- Ratings & Share Buttons
                  const TRatingsAndShare(),

                  /// -- Price , Title, Stock & Brand
                  const TProductMetaData(),

                  /// -- Attributes
                  const TProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        debugPrint("Check Out Button Pressed");
                        Get.to(() => const CheckoutScreen());
                      },
                      child: Text('Checkout'),
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ReadMoreText(
                    'This is a Product description for white Nike Air Force - 1 shoes. There are more things that can be added but ',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  /// -- Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                        title: 'Reviews(199)',
                        showActionButton: false,
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                      ),
                      IconButton(
                        onPressed: () {
                          debugPrint("Review Pressed");
                          Get.to(() => const ProductReviewsScreen());
                        },
                        icon: Icon(Iconsax.arrow_right_3, size: 18),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
