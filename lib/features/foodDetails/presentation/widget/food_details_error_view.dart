import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:flutter/material.dart';

class FoodDetailsErrorView extends StatelessWidget {
  const FoodDetailsErrorView({
    super.key,
    required this.message,
    required this.onRetry,
  });

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          const SizedBox(height: AppSizes.padding_16),
          TextButton(onPressed: onRetry, child: Text(LocaleKeys.retry.tr())),
        ],
      ),
    );
  }
}
