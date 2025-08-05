import 'package:d_store/common/widgets/brands/brand_show_case.dart';
import 'package:d_store/common/widgets/layouts/grid_layout.dart';
import 'package:d_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:d_store/common/widgets/texts/section_heading.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const TBrandShowCase(
                images: [
                  TImage.productImage1,
                  TImage.productImage1,
                  TImage.productImage1,
                ],
                
              ),
                            const TBrandShowCase(
                images: [
                  TImage.productImage1,
                  TImage.productImage1,
                  TImage.productImage1,
                ],
                
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Products
              TSectionHeading(
                title: 'You might like',
                showActionButton: true,
                onPressed: () {
                  debugPrint("You might like pressed");
                },
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// -- Display Products
              TGridLayout(
                itemCount: 4,
                itembuilder: (_, context) => const TProductCardVertical(),
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),
      ],
    );
  }
}
