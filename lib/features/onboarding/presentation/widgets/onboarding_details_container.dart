import 'package:blurbox/blurbox.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OnboardingDetailsContainer extends StatelessWidget {
  const OnboardingDetailsContainer({
    super.key,
    required this.body,
    this.width,
    this.height,
    this.contentPadding = const EdgeInsets.all(AppSizes.padding_16),
    this.bottomLeft = AppSizes.borderRadius_50,
    this.bottomRight = AppSizes.borderRadius_50,
    this.topLeft = AppSizes.borderRadius_50,
    this.topRight = AppSizes.borderRadius_50,
  });

  final List<Widget> body;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry contentPadding;
  final double bottomLeft;
  final double bottomRight;
  final double topLeft;
  final double topRight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: body,
      ),
    ).blurry(
      padding: contentPadding,
      blur: 20,
      height: height,
      width: width ?? double.infinity,
      color: AppColorsLight.glassContainerColor.withValues(alpha: 0.1),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(bottomLeft),
        bottomRight: Radius.circular(bottomRight),
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
      ),
    );
  }
}
