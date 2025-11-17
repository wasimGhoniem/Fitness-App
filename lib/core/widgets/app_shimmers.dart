import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmers {
  AppShimmers._();

  static final Color _baseColor = AppColorsLight.black[60]!;
  static final Color _highlightColor = AppColorsLight.black[30]!;

  static const double _borderRadius = AppSizes.borderRadius_20;
  static const double _spacing = AppSizes.spaceBetweenItems_16;

  static Widget _buildBone({
    double? width,
    double? height,
    double borderRadius = _borderRadius,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: _baseColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  static Widget _buildMealItemBone() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColorsLight.black[70]!.withValues(alpha: 0.4),
                  AppColorsLight.black[80]!.withValues(alpha: 0.6),
                ],
              ),
            ),
            child: _buildBone(width: double.infinity, height: double.infinity),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColorsLight.black[100]!.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
              ),
            ),
          ),
          Positioned(
            bottom: AppSizes.padding_8,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding_16,
              ),
              child: Align(
                alignment: Alignment.center,
                child: _buildBone(
                  width: 120,
                  height: AppSizes.font_18,
                  borderRadius: AppSizes.borderRadius_8,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget get tabsShimmer {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      child: Container(
        height: AppSizes.spaceBetweenItems_50,
        padding: const EdgeInsets.symmetric(
          vertical: AppSizes.padding_8,
          horizontal: _spacing,
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => _buildBone(
            width: 80,
            height: AppSizes.icon_30,
            borderRadius: AppSizes.borderRadius_8,
          ),
          separatorBuilder: (context, index) => const SizedBox(width: _spacing),
        ),
      ),
    );
  }

  static Widget get mealsGridShimmer {
    return GridView.builder(
      padding: const EdgeInsets.all(_spacing),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: _spacing,
        mainAxisSpacing: _spacing,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: _baseColor,
          highlightColor: _highlightColor,
          period: Duration(milliseconds: 1200 + (index * 100)),
          child: _buildMealItemBone(),
        );
      },
    );
  }

  static Widget _buildBoneFood({
    required double height,
    double? width = double.infinity,
    double borderRadius = AppSizes.borderRadius_4,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: AppColorsLight.white.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
    );
  }

  static Widget _buildNutritionBadgeBone() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.padding_8,
        vertical: AppSizes.padding_8,
      ),
      decoration: BoxDecoration(
        color: AppColorsLight.black[100]!.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(AppSizes.borderRadius_32),
        border: Border.all(
          color: AppColorsLight.white.withValues(alpha: 0.2),
          width: AppSizes.borderWidth_1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildBone(
            height: AppSizes.font_14,
            width: 45,
            borderRadius: AppSizes.borderRadius_8,
          ),
          const SizedBox(height: AppSizes.padding_4),
          _buildBone(
            height: AppSizes.font_12,
            width: 55,
            borderRadius: AppSizes.borderRadius_8,
          ),
        ],
      ),
    );
  }

  static Widget _buildFoodDetailsHeaderShimmer() {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomRight: Radius.circular(AppSizes.borderRadius_32),
        bottomLeft: Radius.circular(AppSizes.borderRadius_32),
      ),
      child: Stack(
        children: [
          Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColorsLight.black[70]!.withValues(alpha: 0.4),
                  AppColorsLight.black[80]!.withValues(alpha: 0.6),
                ],
              ),
            ),
            child: _buildBone(height: 350, width: double.infinity),
          ),
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: AppColorsLight.black[100]!.withValues(alpha: 0.3),
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(AppSizes.borderRadius_32),
                  bottomLeft: Radius.circular(AppSizes.borderRadius_32),
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.only(
                left: AppSizes.padding_16,
                right: AppSizes.padding_16,
                bottom: AppSizes.padding_16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSizes.padding_24),
                  Container(
                    height: AppSizes.icon_24,
                    width: AppSizes.icon_24,
                    decoration: BoxDecoration(
                      color: AppColorsLight.white.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(
                        AppSizes.borderRadius_4,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBetweenItems_32),
                  Center(
                    child: Container(
                      height: AppSizes.icon_64,
                      width: AppSizes.icon_64,
                      decoration: BoxDecoration(
                        color: AppColorsLight.orange[100]!.withValues(
                          alpha: 0.3,
                        ),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColorsLight.white.withValues(alpha: 0.2),
                          width: AppSizes.borderWidth_2,
                        ),
                      ),
                      child: Center(
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            color: AppColorsLight.white.withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceBetweenItems_32),
                  _buildBone(
                    height: AppSizes.font_22,
                    width: 220,
                    borderRadius: AppSizes.borderRadius_8,
                  ),
                  const SizedBox(height: AppSizes.padding_4),
                  _buildBone(
                    height: AppSizes.font_16,
                    width: double.infinity,
                    borderRadius: AppSizes.borderRadius_8,
                  ),
                  const SizedBox(height: AppSizes.padding_4),
                  _buildBone(
                    height: AppSizes.font_16,
                    width: 280,
                    borderRadius: AppSizes.borderRadius_8,
                  ),
                  const SizedBox(height: AppSizes.padding_20),
                  Row(
                    children: [
                      Expanded(child: _buildNutritionBadgeBone()),
                      const SizedBox(width: AppSizes.padding_8),
                      Expanded(child: _buildNutritionBadgeBone()),
                      const SizedBox(width: AppSizes.padding_8),
                      Expanded(child: _buildNutritionBadgeBone()),
                      const SizedBox(width: AppSizes.padding_8),
                      Expanded(child: _buildNutritionBadgeBone()),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildIngredientItemBone() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSizes.padding_8),
      child: Row(
        children: [
          Expanded(
            child: _buildBone(
              height: AppSizes.font_18,
              borderRadius: AppSizes.borderRadius_8,
            ),
          ),
          const SizedBox(width: AppSizes.padding_8),
          _buildBoneFood(
            height: AppSizes.font_18,
            width: 70,
            borderRadius: AppSizes.borderRadius_8,
          ),
        ],
      ),
    );
  }

  static Widget _buildIngredientsListShimmer() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(AppSizes.borderRadius_20),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: AppColorsLight.glassContainerColor.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
          border: Border.all(
            color: AppColorsLight.white.withValues(alpha: 0.1),
            width: AppSizes.borderWidth_1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSizes.padding_16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildIngredientItemBone(),
              Divider(
                color: AppColorsLight.black[20]!.withValues(alpha: 0.4),
                height: AppSizes.dividerHeight_1,
                thickness: 0.5,
              ),
              _buildIngredientItemBone(),
              Divider(
                color: AppColorsLight.black[20]!.withValues(alpha: 0.4),
                height: AppSizes.dividerHeight_1,
                thickness: 0.5,
              ),
              _buildIngredientItemBone(),
              Divider(
                color: AppColorsLight.black[20]!.withValues(alpha: 0.4),
                height: AppSizes.dividerHeight_1,
                thickness: 0.5,
              ),
              _buildIngredientItemBone(),
              Divider(
                color: AppColorsLight.black[20]!.withValues(alpha: 0.4),
                height: AppSizes.dividerHeight_1,
                thickness: 0.5,
              ),
              _buildIngredientItemBone(),
            ],
          ),
        ),
      ),
    );
  }

  static Widget foodDetailsShimmer() {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      period: const Duration(milliseconds: 1500),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFoodDetailsHeaderShimmer(),
            const SizedBox(height: AppSizes.spaceBetweenItems_16),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.borderRadius_16,
              ),
              child: _buildBone(
                height: AppSizes.font_24,
                width: 140,
                borderRadius: AppSizes.borderRadius_8,
              ),
            ),
            const SizedBox(height: AppSizes.padding_12),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.borderRadius_16,
              ),
              child: _buildIngredientsListShimmer(),
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems_16),
          ],
        ),
      ),
    );
  }

  static Widget _buildProfileHeaderShimmer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: _baseColor,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColorsLight.black[60]!,
                width: AppSizes.borderWidth_1,
              ),
            ),
          ),
        ),
        const SizedBox(height: AppSizes.padding_4),
        _buildBone(
          height: AppSizes.font_22,
          width: 120,
          borderRadius: AppSizes.borderRadius_8,
        ),
      ],
    );
  }

  static Widget get profileHeaderShimmer {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      period: const Duration(milliseconds: 1500),
      child: _buildProfileHeaderShimmer(),
    );
  }
}
