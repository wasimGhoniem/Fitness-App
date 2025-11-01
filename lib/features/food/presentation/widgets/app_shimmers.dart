import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmers {
  AppShimmers._();

  static final Color _baseColor = AppColorsLight.black[60]!;
  static final Color _highlightColor = AppColorsLight.black[30]!;

  static const double _borderRadius = 20.0;
  static const double _spacing = 16.0;

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
      borderRadius: BorderRadius.circular(_borderRadius),
      child: Stack(
        children: [
          _buildBone(width: double.infinity, height: double.infinity),
          Positioned(
            bottom: 8,
            left: _spacing,
            right: _spacing,
            child: Align(
              alignment: Alignment.center,
              child: _buildBone(width: 100, height: 16, borderRadius: 4),
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
        height: 50,
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: _spacing,
        ),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) =>
              _buildBone(width: 80, height: 30, borderRadius: 8),
          separatorBuilder: (context, index) => const SizedBox(width: _spacing),
        ),
      ),
    );
  }

  static Widget get mealsGridShimmer {
    return Shimmer.fromColors(
      baseColor: _baseColor,
      highlightColor: _highlightColor,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: _spacing,
          mainAxisSpacing: _spacing,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return _buildMealItemBone();
        },
      ),
    );
  }
}
