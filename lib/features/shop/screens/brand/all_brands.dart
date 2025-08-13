import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/brands/brand_card.dart';
import 'package:d_store/common/widgets/layouts/grid_layout.dart';
import 'package:d_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:d_store/common/widgets/texts/section_heading.dart';
import 'package:d_store/features/shop/screens/brand/brand_products.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Heading
              TSectionHeading(title: 'Brands', showActionButton: false),
              SizedBox(height: TSizes.spaceBtwItems),

              /// -- Brands
              TGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itembuilder: (context, index) => TBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(
                    () => TBrandCard(
                      showBorder: true,
                      onTap: () => Get.to(() => const TSortableProducts()),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
