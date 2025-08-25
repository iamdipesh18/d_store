import 'package:d_store/utils/constants/sizes.dart';
import 'package:d_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({
    super.key,
    required this.gif,
    required this.title,
    required this.subtitle,
  });

  final String gif;
  final String title;
  final String subtitle;

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with AutomaticKeepAliveClientMixin {
  bool _showGif = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _showGif = true;
      });
    });
  }

  // This is required for AutomaticKeepAliveClientMixin
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context); // call super.build() for KeepAlive mixin

    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          AnimatedOpacity(
            opacity: _showGif ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 400),
            child: Image.asset(
              widget.gif,
              width: THelperFunctions.screenWidth() * 0.8,
              height: THelperFunctions.screenHeight() * 0.6,
              gaplessPlayback: true,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            widget.subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
