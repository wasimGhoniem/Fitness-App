import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.active});
  final bool active;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.all(AppSizes.spaceBetweenItems_2),
      height: AppSizes.spaceBetweenItems_8,
      width: active ? AppSizes.spaceBetweenItems_20 : AppSizes.spaceBetweenItems_8,
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: active ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
      ),
    );
  }
}