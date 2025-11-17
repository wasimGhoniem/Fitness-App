import 'package:fitness_app/core/Config/Theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 8),
        Divider(color: AppColorsLight.black[70]),
        const SizedBox(height: 16),
      ],
    );
  }
}
