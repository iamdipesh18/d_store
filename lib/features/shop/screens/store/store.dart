import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/appbar/tabbar.dart';
import 'package:d_store/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:d_store/common/widgets/layouts/grid_layout.dart';
import 'package:d_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:d_store/common/widgets/brands/brand_card.dart';
import 'package:d_store/common/widgets/texts/section_heading.dart';
import 'package:d_store/features/shop/screens/brand/all_brands.dart';
import 'package:d_store/features/shop/screens/store/widgets/category_tab.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        /// -- AppBar
        appBar: TAppbar(
          title: Text(
            "Store",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [TCartCounterIcon(onPressed: () {})],
        ),

        /// -- Nested Scroll View for both Horizontal and Vertical Scrolling in the screen
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                expandedHeight: 440,

                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      /// -- Search Bar
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const TSearchContainer(
                        text: TText.tSearchInStore,
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                        space: 0.0,
                      ),
                      //  const TSearchContainer(text: TText.tSearchInStore),
                      SizedBox(height: TSizes.spaceBtwSections),

                      /// -- Featured Brands
                      TSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () {
                          debugPrint("Featured Brands Text Pressed");
                          Get.to(() => const AllBrandsScreen());
                        },
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      /// -- Grid Layout [Brands Grid]
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itembuilder: (_, index) {
                          /// -- We will pass each brand and On pressed events also
                          return const TBrandCard(showBorder: true);
                        },
                      ),
                    ],
                  ),
                ),

                /// -- Tabs
                bottom: TTabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "Sports",
                        style: TextStyle(color:dark? TColors.white:TColors.darkerGrey),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Furniture",
                        style: TextStyle(color:dark? TColors.white:TColors.darkerGrey),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Electronics",
                        style: TextStyle(color:dark? TColors.white:TColors.darkerGrey),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Clothes",
                        style: TextStyle(color:dark? TColors.white:TColors.darkerGrey),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Cosmetics",
                        style: TextStyle(color:dark? TColors.white:TColors.darkerGrey),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },

          /// -- Body
          body: const TabBarView(
            children: [
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
              TCategoryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
