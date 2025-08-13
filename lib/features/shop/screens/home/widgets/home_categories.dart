import 'package:d_store/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:d_store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          return TVerticalImageText(
            image: TImage.shoeIcon,
            title: 'Shoe',
            onTap: () =>Get.to(()=> const SubCategoriesScreen()),
          );
        },
      ),
    );
  }
}
