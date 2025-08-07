import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/products/ratings/rating_indicator.dart';
import 'package:d_store/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:d_store/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:d_store/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: TAppbar(title: Text('Reviews & Ratings'), showBackArrow: true),

      // Body
      body: SingleChildScrollView(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Ratings and reviews are verified and are from the people who use the same type of device that you use',
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            //Overall Product Ratings
            const TOverallProductRating(),
            const TRatingBarIndicator(rating: 3.5),
            Text('12,611', style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// -- User Review List
            const TUserReviewCard(),
            const TUserReviewCard(),
            const TUserReviewCard(),
            const TUserReviewCard(),
            const TUserReviewCard(),
            const TUserReviewCard(),
          ],
        ),
      ),
    );
  }
}
