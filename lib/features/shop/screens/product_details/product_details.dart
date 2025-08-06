import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:d_store/common/widgets/icons/t_circular_icon.dart';
import 'package:d_store/common/widgets/images/t_rounded_image.dart';
import 'package:d_store/features/shop/screens/product_details/widgets/product_details_image_slider.dart';
import 'package:d_store/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:d_store/features/shop/screens/product_details/widgets/ratings_and_share_widget.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);

    /// -- Only To Show Static Images for Now (Start)
    final List<String> sliderImages = [
      'assets/images/NikeAF1/Front.png',
      'assets/images/NikeAF1/Side.png',
      'assets/images/NikeAF1/Top.png',
      'assets/images/NikeAF1/Back.png',
      'assets/images/NikeAF1/Bottom.png',
      'assets/images/NikeAF1/Normal.png',
    ];

    /// -- (End)

    return Scaffold(
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
                  TProductMetaData()
                  /// -- Ratings & Share Buttons
                  /// -- Ratings & Share Buttons
                  /// -- Ratings & Share Buttons
                  /// -- Ratings & Share Buttons
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
