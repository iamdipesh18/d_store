import 'package:d_store/utils/constants/colors.dart';
import 'package:d_store/utils/constants/image_strings.dart';
import 'package:d_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

/// A reusable widget that shows:
/// - A Lottie animation
/// - A text below it
/// - Optionally, an action button (e.g., Retry, Refresh)
///
/// Handles screen overflow gracefully by wrapping content in
/// a scrollable container (`SingleChildScrollView`).
class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    required this.animation,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  /// Text displayed below the animation
  final String text;

  /// Path to the Lottie animation file (inside assets)
  final String animation;

  /// Whether to show the action button
  final bool showAction;

  /// Label of the action button (if [showAction] = true)
  final String? actionText;

  /// Callback when the action button is pressed
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min, // Prevents overflow
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Lottie Animation
            Lottie.asset(
              TImage.loading,
              width: MediaQuery.of(context).size.width * 0.8,
            ),
            const SizedBox(height: TSizes.defaultSpace),

            /// Info Text
            Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: TSizes.defaultSpace),

            /// Optional Action Button
            showAction
                ? SizedBox(
                    width: 250,
                    child: OutlinedButton(
                      onPressed: onActionPressed,
                      style: OutlinedButton.styleFrom(
                        backgroundColor: TColors.dark,
                      ),
                      child: Text(
                        actionText ?? "",
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.apply(color: TColors.light),
                      ),
                    ),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
