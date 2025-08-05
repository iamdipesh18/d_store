import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:d_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: TAppbar(
        title: Text("Store", style: Theme.of(context).textTheme.headlineMedium),
        actions: [TCartCounterIcon(onPressed: () {})],
      ),
      /// -- Nested Scroll View for both Horizontal and Vertical Scrolling in the screen
    );
  }
}
