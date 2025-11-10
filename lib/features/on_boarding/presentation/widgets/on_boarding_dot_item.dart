import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OnboardingDotItem extends StatelessWidget {
  const OnboardingDotItem({super.key, required this.isSelected});
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      height: 10,
      width: isSelected ? 24 : 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
        color: isSelected ? colorScheme.primary : AppColorsLight.black[10],
      ),
    );
  }
}
