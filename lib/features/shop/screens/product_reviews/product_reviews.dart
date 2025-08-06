import 'package:d_store/common/widgets/appbar/appbar.dart';
import 'package:flutter/material.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App bar
      appBar: TAppbar(title: Text('Reviews & Ratings')),

      // Body
      body: SingleChildScrollView(
        
      ),
    );
  }
}
