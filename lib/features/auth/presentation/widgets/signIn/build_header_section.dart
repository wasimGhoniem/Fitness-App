import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class BuildHeaderSection extends StatelessWidget {
  const BuildHeaderSection({
    super.key,
    required this.imagePath,
    required this.firstText,
    required this.secondText,
    this.iconHeight = AppSizes.imageHeight_48,
    this.iconWidth = AppSizes.imageWidth_70,
  });

  final String imagePath;
  final String firstText;
  final String secondText;

  final double iconHeight;
  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          child: Image.asset(imagePath, height: iconHeight, width: iconWidth),
        ),
        const SizedBox(height: AppSizes.spaceBetweenItems_85),
        CustomText(
          text: firstText,
          style: Theme.of(context).textTheme.bodyMedium!,
        ),
        CustomText(
          text: secondText,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800),
        ),
      ],
    );
  }
}
