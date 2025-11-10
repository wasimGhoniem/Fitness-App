import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/widgets/custom_text.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/custom_appbar.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/progress_widget.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/radio_item.dart';
import 'package:flutter/material.dart';

class GoalAndPhysicalWidget<T> extends StatelessWidget {
  const GoalAndPhysicalWidget({
    super.key,
    required this.valueNotifier,
    required this.pageController,
    required this.question,
    required this.choices,
    this.totalSteps = 7,
    required this.pageNotifier,
    required this.getDisplayName,
  });

  final ValueNotifier<T?> valueNotifier;
  final ValueNotifier<int> pageNotifier;
  final PageController pageController;
  final String question;
  final List<T> choices;
  final int? totalSteps;
  final String Function(T) getDisplayName;

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
                Align(
                  child: ProgressWidget(
                    valueNotifier: pageNotifier,
                    TotalSteps: totalSteps!,
                  ),
                ),
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
                      onPressed: () {
                        if (valueNotifier.value == null) {
                          return;
                        }
                        pageController.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                      },
                      isLoading: false,
                      widget: Text(LocaleKeys.next.tr()),
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
