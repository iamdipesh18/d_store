import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({super.key, required this.text, required this.animation, required this.showAction, this.actionText, this.onActionPressed});

  // Default Constructor for the TAnimationLoaderWidget
  //
  // Parameters:
  /*
  texts : the text to be displayed below the animation
  animation : the path to the lotie animationfile
  showaction : whether to show an action button below the text
  actionText: the text to be displayed on the action button
  onActionPressed : callback function to be executed when the action button is pressed
  */
  final String text;
  final String animation;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            animation,
            width: MediaQuery.of(context).size.width * 0.8,
          ), // Display Lottie Animation
          const SizedBox(height: TSizes.defaultSpace),

          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace),
          showAction
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                    onPressed: onActionPressed,
                    child: Text(
                      actionText!,
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.apply(color: TColors.light),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
