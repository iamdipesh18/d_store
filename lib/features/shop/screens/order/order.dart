import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/features/shop/screens/order/widgets/order_list.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      //Appbar
      appBar: TAppbar(
        showBackArrow: true,
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      //Body
      body: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      //Orders
      child: TOrderListItems(),
      ),
    );
  }
}
