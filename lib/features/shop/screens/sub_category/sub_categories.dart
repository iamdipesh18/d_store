import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/images/t_rounded_image.dart';
import 'package:d_store/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:d_store/common/widgets/texts/section_heading.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text("Sports"), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Banner
              const TRoundedImage(
                imageUrl: TImage.promoBanner2,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Sub Categories
              Column(
                children: [
                  // Heading
                  TSectionHeading(
                    title: 'Sports shirts',
                    onPressed: () {
                      debugPrint('View All Pressed');
                    },
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) =>
                          const SizedBox(width: TSizes.spaceBtwItems),
                      itemBuilder: (context, index) =>
                          const TProductCardHorizontal(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
