import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({super.key});

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
    return const Placeholder();
  }
}
