import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class NutritionBadge extends StatelessWidget {
  const NutritionBadge({super.key, required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.padding_8,
        vertical: AppSizes.padding_8,
      ),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: .35),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius_32),
        border: Border.all(color: Colors.white),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            value,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: AppColorsLight.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: AppSizes.padding_4),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
