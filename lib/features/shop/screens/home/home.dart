import 'package:d_store/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:d_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:d_store/common/widgets/layouts/grid_layout.dart';
import 'package:d_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:d_store/common/widgets/texts/section_heading.dart';
import 'package:d_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:d_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:d_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  const THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Search Bar
                  const TSearchContainer(text: TText.tSearchInStore),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Categories
                  Padding(
                    padding: EdgeInsetsGeometry.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// --- Headings
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// --- Categories
                        const THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// -- Body Part
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Promo Sliders
                  const TPromoSlider(
                    banners: [
                      TImage.promoBanner1,
                      TImage.promoBanner2,
                      TImage.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Popular Products
                  TGridLayout(itemCount: 2, itembuilder: (_,index)=> const TProductCardVertical()),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
