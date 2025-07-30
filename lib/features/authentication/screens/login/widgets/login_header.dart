import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/constants/text_strings.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({super.key});

  

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 150,
          image: AssetImage(dark ? TImage.darkApplogo : TImage.lightApplogo),
        ),
        Text(
          TText.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.sm),
        Text(
          TText.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}
