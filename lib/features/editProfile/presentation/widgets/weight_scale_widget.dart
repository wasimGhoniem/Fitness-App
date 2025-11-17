import 'package:easy_localization/easy_localization.dart';
import 'package:fitness_app/core/localization/locale_keys.g.dart';
import 'package:fitness_app/core/utils/constants/app_assets.dart';
import 'package:fitness_app/core/utils/constants/sizes.dart';
import 'package:fitness_app/core/widgets/custom_elevated_button.dart';
import 'package:fitness_app/core/widgets/custom_text.dart';
import 'package:fitness_app/core/widgets/glass_container.dart';
import 'package:fitness_app/core/widgets/glass_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:numberpicker/numberpicker.dart';

class WeightScaleWidget extends StatelessWidget {
  const WeightScaleWidget({
    super.key,
    required this.valueNotifier,
    required this.question,
    required this.text,
    required this.maxValue,
    required this.minValue,
    required this.onPressed,
  });

  final ValueNotifier<int> valueNotifier;
  final String question;
  final String text;
  final int maxValue;
  final int minValue;
  final VoidCallback? onPressed ;

  @override
  Widget build(BuildContext context) {
    return GlassLayout(
      backGroundImage: Assets.assetsImagesAuthBg,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          children: [
                            Text(
                              text,
                              style: Theme.of(context).textTheme.labelMedium!
                                  .copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            CustomNumberPicker(
                              valueNotifier: valueNotifier,
                              minValue: minValue,
                              maxValue: maxValue,
                            ),
                            SvgPicture.asset('assets/icons/Vector.svg'),
                          ],
                        ),
                      ),
                      const SizedBox(height: AppSizes.spaceBetweenItems_32),
                      CustomElevatedButton(
                        onPressed: onPressed,
                        isLoading: false,
                        widget: const Text('Done'),
                      ),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomNumberPicker extends StatelessWidget {
  const CustomNumberPicker({
    super.key,
    required this.valueNotifier,
    required this.minValue,
    required this.maxValue,
    this.axis = Axis.horizontal,
    this.itemHeight = 80,
  });

  final ValueNotifier<int> valueNotifier;
  final int minValue;
  final int maxValue;
  final Axis axis;
  final double itemHeight;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: valueNotifier,
      builder: (context, value, _) {
        final clampedValue = value.clamp(minValue, maxValue);

        return NumberPicker(
          itemHeight: itemHeight,
          axis: axis,
          value: clampedValue,
          minValue: minValue,
          maxValue: maxValue,
          onChanged: (newValue) => valueNotifier.value = newValue,
          selectedTextStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
          textStyle: Theme.of(
            context,
          ).textTheme.headlineMedium!.copyWith(fontSize: AppSizes.font_32),
        );
      },
    );
  }
}
