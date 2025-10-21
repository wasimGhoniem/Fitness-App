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
  });

  final List<Widget> body;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: body,
      ),
    ).blurry(
      padding: contentPadding,
      blur: 20,
      height: height,
      width: width ?? double.infinity,
      // ignore: deprecated_member_use
      color: AppColorsLight.glassContainerColor.withOpacity(0.1),
      borderRadius: BorderRadius.circular(AppSizes.borderRadius_50),
    );
  }
}
