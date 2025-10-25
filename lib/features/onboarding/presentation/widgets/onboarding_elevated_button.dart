import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OnboardingElevatedButton extends StatelessWidget {
  const OnboardingElevatedButton({
    super.key,
    required this.onPressed,
    required this.widget,
    this.textColor,
    this.buttonHigh,
    this.backgroundColor = AppColorsLight.orange,
  });

  final void Function()? onPressed;
  final Widget widget;
  final Color? textColor;
  final Color? backgroundColor;
  final double? buttonHigh;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        height: AppSizes.buttonHigh_38,
        width: AppSizes.buttonWidth_80,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        child: SizedBox(
          height: buttonHigh ?? AppSizes.buttonHigh_38,
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.borderRadiusFull),
                side: const BorderSide(width: 1, color: AppColorsLight.orange),
              ),
            ),
            child: widget,
          ),
        ),
      ),
    );
  }
}
