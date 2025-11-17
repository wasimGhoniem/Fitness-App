import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/widgets/custom_text.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/custom_appbar.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/radio_item.dart';
import 'package:flutter/material.dart';

class GoalScaleWidget<T> extends StatelessWidget {
  const GoalScaleWidget({
    super.key,
    required this.valueNotifier,
    required this.question,
    required this.choices,
    required this.getDisplayName,
    required this.onPressed,
  });

  final ValueNotifier<T?> valueNotifier;
  final String question;
  final List<T> choices;
  final String Function(T) getDisplayName;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GlassLayout(
      backGroundImage: Assets.assetsImagesAuthBg,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.spaceBetweenItems_40),
                const CustomAppBarr(),
                const Spacer(),

                CustomText(
                  text: question,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800),
                ),
                CustomText(
                  text: LocaleKeys.thisHelpsUsCreateYourPersonalizedPlan.tr(),
                  style: Theme.of(context).textTheme.bodyMedium!,
                ),
                const SizedBox(height: AppSizes.spaceBetweenItems_16),
                GlassContainer(
                  width: double.infinity,
                  contentPadding: const EdgeInsetsGeometry.symmetric(
                    horizontal: AppSizes.padding_16,
                    vertical: AppSizes.padding_24,
                  ),
                  body: [
                    ValueListenableBuilder(
                      valueListenable: valueNotifier,
                      builder: (context, value, child) => Column(
                        children: choices
                            .map(
                              (choice) => RadioItem(
                                title: getDisplayName(choice),
                                isSelected: choice == valueNotifier.value,
                                onTap: () => valueNotifier.value = choice,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems_16),
                    CustomElevatedButton(
                      onPressed:onPressed,
                      isLoading: false,
                      widget: const Text('Done'),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
