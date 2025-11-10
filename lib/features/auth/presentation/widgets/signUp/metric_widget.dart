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
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';

class UserMetricWidget extends StatelessWidget {
  const UserMetricWidget({
    super.key,
    required this.valueNotifier,
    required this.pageController,
    required this.question,
    this.totalSteps = 7,
    required this.pageNotifer,
    required this.text,
  });
  final ValueNotifier<int> valueNotifier;
  final PageController pageController;
  final String question;
  final int? totalSteps;
  final ValueNotifier<int> pageNotifer;
  final String text;

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
                    valueNotifier: pageNotifer,
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
                        children: [
                          Text(
                            text,
                            style: Theme.of(context).textTheme.labelMedium!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                          ),
                          NumberPicker(
                            itemHeight: 80,
                            selectedTextStyle: Theme.of(context)
                                .textTheme
                                .displayLarge!
                                .copyWith(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                            textStyle: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(fontSize: AppSizes.font_32),
                            axis: Axis.horizontal,
                            value: valueNotifier.value,
                            minValue: 0,
                            maxValue: 300,
                            onChanged: (value) => valueNotifier.value = value,
                          ),
                          SvgPicture.asset('assets/icons/Vector.svg'),
                        ],
                      ),
                    ),
                    const SizedBox(height: AppSizes.spaceBetweenItems_32),
                    CustomElevatedButton(
                      onPressed: () {
                        if (valueNotifier.value < 0) {
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
