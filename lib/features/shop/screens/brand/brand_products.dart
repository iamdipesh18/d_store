import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/brands/brand_card.dart';
import 'package:d_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: TAppbar(title: Text('Nike'))
    ,
    body:  SingleChildScrollView(
      child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          /// -- Brand Details
          TBrandCard(showBorder: true,),
          SizedBox(height: TSizes.spaceBtwSections,),
          TSortableProducts(),
        ],
      ),),
    ),);
  }
}
