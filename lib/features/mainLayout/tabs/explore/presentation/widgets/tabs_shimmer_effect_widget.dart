import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TabsShimmerEffectWidget extends StatelessWidget {
  const TabsShimmerEffectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        highlightColor: AppColorsLight.black[30]!,
        baseColor: AppColorsLight.black[60]!,
      ),
      child: SizedBox(
        height: 20,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.padding_16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Bone(
            width: 100,
            height: 20,
            borderRadius: BorderRadius.circular(20),
          ),
          separatorBuilder: (context, index) => const SizedBox(width: 10),
          itemCount: 5,
        ),
      ),
    );
  }
}
