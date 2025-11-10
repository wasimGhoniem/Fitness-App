import 'package:fitness_app/features/on_boarding/presentation/widgets/on_boarding_dot_item.dart';
import 'package:flutter/material.dart';

class OnBoardingDotWidget extends StatelessWidget {
  const OnBoardingDotWidget({
    super.key,
    required this.currentIndex,
    required this.totalPages,
  });

  final int currentIndex;
  final int totalPages;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => OnboardingDotItem(isSelected: index == currentIndex),
      ),
    );
  }
}
