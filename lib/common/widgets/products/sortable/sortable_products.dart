import 'package:d_store/common/widgets/layouts/grid_layout.dart';
import 'package:d_store/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -- DropDown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items:
              [
                    'Name',
                    'Higher Price',
                    'Lower Price',
                    'Sale',
                    'Newest',
                    'Popularity',
                  ]
                  .map(
                    (option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                    ),
                  )
                  .toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),
        /// -- Products
        TGridLayout(itemCount: 8, itembuilder: (_,index)=>const TProductCardVertical(),),
    
      ],
    );
  }
}
