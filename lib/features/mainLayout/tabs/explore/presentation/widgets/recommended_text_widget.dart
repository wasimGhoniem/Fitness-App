import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class RecommendationToDayTextWidget extends StatelessWidget {
  const RecommendationToDayTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.padding_16,
        vertical: AppSizes.padding_8,
      ),
      child: Text(
        LocaleKeys.recommendation_to_day.tr(),
        style: Theme.of(
          context,
        ).textTheme.bodySmall!.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
