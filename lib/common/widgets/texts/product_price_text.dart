import 'package:flutter/material.dart';

class TProductPriceText extends StatelessWidget {
  const TProductPriceText({
    super.key,
    required this.price,
    this.isLarge = false,
    this.currencySign = '\$',
    this.lineThrough = false,
    this.maxLines = 1,
  });
  final String price;
  final String currencySign;
  final bool isLarge;
  final bool lineThrough;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      currencySign + price,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,

      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            )
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: lineThrough ? TextDecoration.lineThrough : null,
            ),
    );
  }
}
