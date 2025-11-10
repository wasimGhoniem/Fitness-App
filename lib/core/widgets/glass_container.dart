import 'package:blurbox/blurbox.dart';
import 'package:fitness_app/core/config/theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class GlassContainer extends StatelessWidget {
  const GlassContainer({
    super.key,
    required this.body,
    required this.width,
    this.height,
    this.contentPadding = const EdgeInsets.all(AppSizes.padding_16),
    this.opacity = 0.1,
    this.radius = AppSizes.borderRadius_50,
    this.borderRadius,
  });

  final List<Widget> body;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry contentPadding;
  final double? opacity;
  final double? radius;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: body,
    ).blurry(
      padding: contentPadding,
      blur: 20,
      height: height,
      width: width ?? double.infinity,
      // ignore: deprecated_member_use
      color: AppColorsLight.glassContainerColor.withOpacity(opacity!),
      borderRadius: borderRadius ?? BorderRadius.circular(radius!),
    );
  }
}

class RowGlassContainer extends StatelessWidget {
  const RowGlassContainer({
    super.key,
    required this.body,
    required this.width,
    this.height,
    this.contentPadding = const EdgeInsets.all(AppSizes.padding_16),
    this.opacity = 0.1,
    this.radius = AppSizes.borderRadius_50,
  });

  final List<Widget> body;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry contentPadding;
  final double? opacity;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: body,
          ),
        ),
      ),
    ).blurry(
      padding: contentPadding,
      blur: 20,
      height: height,
      width: width ?? double.infinity,
      // ignore: deprecated_member_use
      color: AppColorsLight.glassContainerColor.withOpacity(opacity!),
      borderRadius: BorderRadius.circular(radius!),
    );
  }
}
