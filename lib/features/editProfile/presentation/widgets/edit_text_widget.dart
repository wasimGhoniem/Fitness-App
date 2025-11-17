import 'package:fitness_app/core/Config/Theme/app_colors.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EditTextWidget extends StatelessWidget {

  const EditTextWidget({
    super.key,
    required this.controller,
    required this.title,
    required this.onTap,
    this.suffix = '',
  });
  final ValueListenable<TextEditingValue> controller;
  final String title;
  final VoidCallback? onTap;
  final String suffix;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<TextEditingValue>(
      valueListenable: controller,
      builder: (context, value, child) {
        return Column(
          children: [
            Row(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                const SizedBox(width: 4),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    '(tap to edit)',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSizes.spaceBetweenItems_12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.padding_16,
                vertical: AppSizes.padding_8,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.borderRadius_20),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
              child: Text(
                '${value.text}$suffix',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColorsLight.black[20]),
              ),
            ),
          ],
        );
      },
    );
  }
}
