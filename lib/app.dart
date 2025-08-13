import 'package:d_store/features/authentication/screens/onboarding/onboarding.dart';
import 'package:d_store/features/personalization/screens/address/add_new_address.dart';
import 'package:d_store/features/personalization/screens/address/address.dart';
import 'package:d_store/features/personalization/screens/profile/profile.dart';
import 'package:d_store/features/shop/screens/all_products/all_product.dart';
import 'package:d_store/features/shop/screens/brand/all_brands.dart';
import 'package:d_store/features/shop/screens/cart/cart.dart';
import 'package:d_store/features/shop/screens/checkout/checkout.dart';
import 'package:d_store/features/shop/screens/order/order.dart';
import 'package:d_store/features/shop/screens/product_details/product_details.dart';
import 'package:d_store/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:d_store/features/shop/screens/store/store.dart';
import 'package:d_store/features/shop/screens/sub_category/sub_categories.dart';
import 'package:d_store/navigation_menu.dart';
import 'package:flutter/material.dart';
import 'package:d_store/utils/theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

/// Use this class to set up themes, initial bindings m any animations, and other app-wide settings.
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system, // Use system theme mode
      theme: TAppTheme.lightTheme, // for light theme
      darkTheme: TAppTheme.darkTheme, // for dark theme/
      home: const OnBoardingScreen(), // Initial screen
      // home: const NavigationMenu(),
      // home: const HomeScreen(),
      // home: const StoreScreen(),
      // home: const ProfileScreen(),
      // home: const ProductDetailScreen(),
      // home: const ProductReviewsScreen(),
      // home: const UserAddressScreen(),
      // home: const CartScreen(),
      // home: const CheckoutScreen(),
      //  home: const AddNewAddressScreen(),
      // home: const OrderScreen(),
      // home:  const SubCategoriesScreen(),
      // home:  const AllProducts(),
      // home:const AllBrandsScreen(),
      debugShowCheckedModeBanner: false, // Hide debug banner
    );
  }
}
