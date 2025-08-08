import 'package:d_store/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class TCouponCode extends StatelessWidget {
  const TCouponCode({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: isDark ? TColors.dark : TColors.white,
      padding: const EdgeInsets.only(
        top: TSizes.sm,
        bottom: TSizes.sm,
        right: TSizes.sm,
        left: TSizes.md,
      ),
      child: Row(
        children: [
          /// Textfield
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// -- Buttons
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: () {
                debugPrint("Promocode Apply Button Pressed");
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: isDark
                    ? TColors.white.withOpacity(0.1)
                    : TColors.dark.withOpacity(0.5),
                // backgroundColor: Colors.grey.withOpacity(0.2),
                backgroundColor: TColors.primary,
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child:  Text('Apply',style: TextStyle(color: TColors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
