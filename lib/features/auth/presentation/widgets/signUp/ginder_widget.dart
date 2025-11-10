import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/enum/gender_enum.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/widgets/custom_text.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/custom_appbar.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/ginder_selctor_widget.dart';
import 'package:fitness_app/features/auth/presentation/widgets/signUp/progress_widget.dart';
import 'package:flutter/material.dart';

class GinderWidget extends StatelessWidget {
  const GinderWidget({
    super.key,
    required this.selectedGenderNotifier,
    required this.pageController,
    this.totalSteps = 7,
    required this.pageNotifier,
  });
  final ValueNotifier<GenderEnum?> selectedGenderNotifier;
  final ValueNotifier<int> pageNotifier;
  final PageController pageController;
  final int? totalSteps;

  @override
  Widget build(BuildContext context) {
    return GlassLayout(
      backGroundImage: Assets.assetsImagesAuthBg,

      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
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
                const SizedBox(height: AppSizes.spaceBetweenItems_10),
                CustomText(
                  text: LocaleKeys.tellUsAboutYourself.tr(),
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w800),
                ),
                CustomText(
                  text: LocaleKeys.weNeedToKnowYourGender.tr(),
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
                      valueListenable: selectedGenderNotifier,
                      builder: (context, value, child) {
                        return GenderSelector(
                          genderEnumNotifier: selectedGenderNotifier,
                        );
                      },
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems_24),
                    CustomElevatedButton(
                      onPressed: () {
                        if (selectedGenderNotifier.value == null) {
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

                const Spacer(flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
