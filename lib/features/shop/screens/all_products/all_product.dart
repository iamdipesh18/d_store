import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/products/sortable/sortable_products.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppbar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: TSortableProducts(),
      ),
    );
  }
}
